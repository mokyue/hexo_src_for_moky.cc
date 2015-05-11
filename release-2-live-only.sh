BASE_DIR=$(cd `dirname $0` && pwd)
git pull origin master && ${BASE_DIR}/generate.sh && ${BASE_DIR}/deploy.sh
