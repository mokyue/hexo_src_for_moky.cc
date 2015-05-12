function sync
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

sync
