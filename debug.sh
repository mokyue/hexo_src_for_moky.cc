function debug
{
    $(cd `dirname $0` && pwd)/generate.sh && hexo server
}

debug
