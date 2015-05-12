DEPLOY_DIR=$(cd `dirname $0` && pwd)/.deploy
git config --global user.name "Moky" && git config --global user.email "mokyue@163.com" && git config --global core.autocrlf false && rm -rf ${DEPLOY_DIR} && hexo deploy && rm -rf ${DEPLOY_DIR}
