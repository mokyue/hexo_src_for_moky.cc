BASE_DIR=$(cd `dirname $0` && pwd)
${BASE_DIR}/generate.sh && ${BASE_DIR}/deploy.sh
