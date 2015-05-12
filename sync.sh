function sync_git
{
    git config --global user.name "Moky" && git config --global user.email "mokyue@163.com" && git add -A && git commit -m "Source updated: $(date)" && git push origin master
}

function sync_svn
{
    BASE_DIR=$(cd `dirname $0` && pwd)
    svn add --force ${BASE_DIR}
    svn commit -m "Source updated: $(date)" ${BASE_DIR}
    svn status ${BASE_DIR} | while read LN_OUTPUT
    do
        echo "[warn] There are some unknown conflicts, please solve it manually."
        break
    done
    svn status ${BASE_DIR} | while read LN_OUTPUT
    do
        echo ${LN_OUTPUT}
    done
}

function sync
{
    if [ $# -ne 1 ]
    then
        echo "[error] Parameter error, required 1 parameter only."
        exit 1
    fi
    if [ "$1"x == "git"x -o "$1"x == "svn"x ]
    then
        if [ "$1"x == "git"x ]
        then
            sync_git
        else
            sync_svn
        fi
    else
        echo "[usage] $0 [git/svn]"
        exit 1
    fi
}

sync $@
