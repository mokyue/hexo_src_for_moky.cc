function commit_change
{
    svn add --force ${WAREHOUSE_DIR}
    svn commit -m "Warehouse updated: $(date)" ${WAREHOUSE_DIR}
    svn status ${WAREHOUSE_DIR} | while read LN_OUTPUT
    do
        echo "[warn] There are some unknown conflicts, please solve it manually."
        svn status ${WAREHOUSE_DIR} | while read LN_OUTPUT
        do
            echo ${LN_OUTPUT}
        done
        break
    done
}

function backup_all
{
    BASE_DIR=$(cd `dirname $0` && pwd)
    CONFIG_FILE=${BASE_DIR}/backup-svn.conf
    if [ ! -f ${CONFIG_FILE} ]
    then
        echo "[fatal] Config file ${CONFIG_FILE} does not exist."
        exit 1
    fi
    source ${CONFIG_FILE}
    echo "[info] WAREHOUSE_DIR=${WAREHOUSE_DIR}"
    if [ ! -d ${WAREHOUSE_DIR} ]
    then
        echo "[fatal] Warehouse directory ${WAREHOUSE_DIR} does not exist."
        exit 1
    fi
    NO=0
    TARGET_DIR=""
    while ((1))
    do
        ((NO++))
        TARGET_DIR=${WAREHOUSE_DIR}/$(date +%Y%m%d)$(printf "%02d" ${NO})
        if [ ! -d ${TARGET_DIR} ]
        then
            mkdir ${TARGET_DIR} && echo "[info] Backup directory ${TARGET_DIR} created."
            break
        fi
    done
    if [ ! -d ${TARGET_DIR} ]
    then
        echo "[fatal] Failed to create ${TARGET_DIR}."
        exit 1
    fi
    PROJ_DIR=${TARGET_DIR}/moky.cc
    cp -r ${BASE_DIR}/../trunk ${PROJ_DIR}
    if [ ! -d ${PROJ_DIR} ]
    then
        echo "[fatal] Failed to copy ${BASE_DIR}/../trunk."
        exit 1
    fi
    DEPLOY_DIR=${PROJ_DIR}/.deploy
    if [ -d ${DEPLOY_DIR} ]
    then
        rm -rf ${DEPLOY_DIR} || echo "[fatal] Failed to remove ${DEPLOY_DIR}."
    fi
    PUBLIC_DIR=${PROJ_DIR}/public
    if [ -d ${PUBLIC_DIR} ]
    then
        rm -rf ${PUBLIC_DIR} || echo "[fatal] Failed to remove ${PUBLIC_DIR}."
    fi
    cd ${TARGET_DIR}
    rar a -v500k -df moky.cc.rar moky.cc || echo "[fatal] Failed to compress ${PROJ_DIR}."
    commit_change
}

function backup_article
{
    BASE_DIR=$(cd `dirname $0` && pwd)
    CONFIG_FILE=${BASE_DIR}/backup-svn.conf
    if [ ! -f ${CONFIG_FILE} ]
    then
        echo "[fatal] Config file ${CONFIG_FILE} does not exist."
        exit 1
    fi
    source ${CONFIG_FILE}
    echo "[info] WAREHOUSE_DIR=${WAREHOUSE_DIR}"
    if [ ! -d ${WAREHOUSE_DIR} ]
    then
        echo "[fatal] Warehouse directory ${WAREHOUSE_DIR} does not exist."
        exit 1
    fi
    ARTICLE_DIR=${WAREHOUSE_DIR}/article
    if [ -d ${ARTICLE_DIR} ]
    then
        rm -rf ${ARTICLE_DIR} || echo "[fatal] Failed to remove ${ARTICLE_DIR}."
    fi
    cp -r ${BASE_DIR}/source/_posts ${ARTICLE_DIR}
    if [ ! -d ${ARTICLE_DIR} ]
    then
        echo "[fatal] Failed to copy ${ARTICLE_DIR}."
        exit 1
    fi
    commit_change
}

function backup
{
    PARM=""
    if [ $# -ne 1 ]
    then
        PARM="article"
    else
        PARM=$1
    fi
    if [ "${PARM}"x == "all"x -o "${PARM}"x == "article"x ]
    then
        if [ "${PARM}"x == "all"x ]
        then
            backup_all
        else
            backup_article
        fi
    else
        echo "[usage] $0 [all/article]"
        exit 1
    fi
}

backup $@
