function release
{
    BASE_DIR=$(cd `dirname $0` && pwd)
    svn update ${BASE_DIR} && ${BASE_DIR}/generate.sh && ${BASE_DIR}/deploy-svn.sh
}

release
