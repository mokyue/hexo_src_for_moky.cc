hexo clean
BASE_DIR=$(cd `dirname $0` && pwd)
rm -rf ${BASE_DIR}/public/*
hexo generate
cp ${BASE_DIR}/CNAME ${BASE_DIR}/public
cp ${BASE_DIR}/robots.txt ${BASE_DIR}/public
cp ${BASE_DIR}/LICENSE ${BASE_DIR}/public
cp ${BASE_DIR}/README.md ${BASE_DIR}/public
cp ${BASE_DIR}/googlea7f3bc2968c9cd14.html ${BASE_DIR}/public
cp ${BASE_DIR}/baidu_verify_hWI4mkl2O3.html ${BASE_DIR}/public
