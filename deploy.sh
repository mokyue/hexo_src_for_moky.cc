git config --global user.name "Moky" && git config --global user.email "mokyue@163.com" && git config --global core.autocrlf false && rm -rf $(cd `dirname $0` && pwd)/.deploy && hexo deploy
