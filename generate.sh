hexo clean
rm -rf $(cd `dirname $0` && pwd)/public/*
hexo generate
cp $(cd `dirname $0` && pwd)/CNAME $(cd `dirname $0` && pwd)/public
cp $(cd `dirname $0` && pwd)/robots.txt $(cd `dirname $0` && pwd)/public
cp $(cd `dirname $0` && pwd)/LICENSE $(cd `dirname $0` && pwd)/public
cp $(cd `dirname $0` && pwd)/README.md $(cd `dirname $0` && pwd)/public
cp $(cd `dirname $0` && pwd)/googlea7f3bc2968c9cd14.html $(cd `dirname $0` && pwd)/public
cp $(cd `dirname $0` && pwd)/baidu_verify_hWI4mkl2O3.html $(cd `dirname $0` && pwd)/public
