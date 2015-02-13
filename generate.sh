BASE_DIR=$(cd `dirname $0` && pwd)
hexo clean && rm -rf ${BASE_DIR}/public/* && hexo generate && cp ${BASE_DIR}/root/* ${BASE_DIR}/public
