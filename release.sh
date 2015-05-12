function release
{
    if [ $# -ne 1 ]
    then
        echo "[error] Parameter error, required 1 parameter only."
        exit 1
    fi
    if [ "$1"x == "git"x -o "$1"x == "svn"x ]
    then
        BASE_DIR=$(cd `dirname $0` && pwd)
        if [ "$1"x == "git"x ]
        then
            git pull origin master && ${BASE_DIR}/generate.sh && ${BASE_DIR}/deploy.sh $1
        else
            svn update ${BASE_DIR} && ${BASE_DIR}/generate.sh && ${BASE_DIR}/deploy.sh $1
        fi
    else
        echo "[usage] $0 [git/svn]"
        exit 1
    fi
}

release $@
