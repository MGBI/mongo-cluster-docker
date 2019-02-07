TAG=$1
if [ -z "$TAG" ]; then
	echo "Usage: $0 <image-tag>"
	exit 1
fi

docker build -f dockerfiles/mongo-rs -t mgbi/mongo-rs:$TAG .
