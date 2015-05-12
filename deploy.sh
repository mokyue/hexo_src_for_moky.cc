function deploy_git
{
    DEPLOY_DIR=$(cd `dirname $0` && pwd)/.deploy
    git config --global user.name "Moky" && git config --global user.email "mokyue@163.com" && git config --global core.autocrlf false && rm -rf ${DEPLOY_DIR} && hexo deploy && rm -rf ${DEPLOY_DIR}
}

function deploy_svn
{
    BASE_DIR=$(cd `dirname $0` && pwd)
    CONFIG_FILE=${BASE_DIR}/deploy-svn.conf
    if [ ! -f ${CONFIG_FILE} ]
    then
        echo "[fatal] Config file ${CONFIG_FILE} does not exist."
        exit 1
    fi
    source ${CONFIG_FILE}
    echo "[info] OUT_TRAY_DIR=${OUT_TRAY_DIR}"
    if [ ! -d ${OUT_TRAY_DIR} ]
    then
        echo "[fatal] Out-tray directory ${OUT_TRAY_DIR} does not exist."
        exit 1
    fi
    rm -rf ${OUT_TRAY_DIR}/*
    cp -r ${BASE_DIR}/public/* ${OUT_TRAY_DIR}
    svn add --force ${OUT_TRAY_DIR}
    svn commit -m "Site updated: $(date)" ${OUT_TRAY_DIR}
    svn status ${OUT_TRAY_DIR} | while read LN_OUTPUT
    do
        echo "[warn] There are some unknown conflicts, please solve it manually."
        svn status ${OUT_TRAY_DIR} | while read LN_OUTPUT
        do
            echo ${LN_OUTPUT}
        done
        break
    done
}

function deploy
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
            deploy_git
        else
            deploy_svn
        fi
    else
        echo "[usage] $0 [git/svn]"
        exit 1
    fi
}

deploy $@
