function release_n_sync
{
    if [ $# -ne 1 ]
    then
        echo "[error] Parameter error, required 1 parameter only."
        exit 1
    fi
    if [ "$1"x == "git"x -o "$1"x == "svn"x ]
    then
        BASE_DIR=$(cd `dirname $0` && pwd)
        ${BASE_DIR}/release.sh $1 && ${BASE_DIR}/sync.sh $1
    else
        echo "[usage] $0 [git/svn]"
        exit 1
    fi
}

release_n_sync $@
