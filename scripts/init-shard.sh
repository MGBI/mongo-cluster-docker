#!/bin/bash 

mongodb1=`getent hosts ${MONGOS} | awk '{ print $1 }'`

mongodb11=`getent hosts ${MONGO11} | awk '{ print $1 }'`
mongodb12=`getent hosts ${MONGO12} | awk '{ print $1 }'`
mongodb1arb=`getent hosts ${MONGO1ARB} | awk '{ print $1 }'`

mongodb21=`getent hosts ${MONGO21} | awk '{ print $1 }'`
mongodb22=`getent hosts ${MONGO22} | awk '{ print $1 }'`
mongodb2arb=`getent hosts ${MONGO2ARB} | awk '{ print $1 }'`

mongodb31=`getent hosts ${MONGO31} | awk '{ print $1 }'`
mongodb32=`getent hosts ${MONGO32} | awk '{ print $1 }'`
mongodb3arb=`getent hosts ${MONGO3ARB} | awk '{ print $1 }'`

port=${PORT:-27017}

echo "Waiting for startup.."
until mongo --host ${mongodb1}:${port} --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)' &>/dev/null; do
  printf '.'
  sleep 1
done

echo "Started.."

echo init-shard.sh time now: `date +"%T" `
mongo --host ${mongodb1}:${port} <<EOF
   sh.addShard( "${RS1}/${mongodb11}:${PORT1},${mongodb12}:${PORT2},${mongodb1arb}:${PORT3}" );
   sh.addShard( "${RS2}/${mongodb21}:${PORT1},${mongodb22}:${PORT2},${mongodb2arb}:${PORT3}" );
   sh.stopBalancer();
   sh.status();
EOF
