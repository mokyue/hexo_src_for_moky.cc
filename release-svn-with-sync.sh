function release_n_sync
{
    BASE_DIR=$(cd `dirname $0` && pwd)
    ${BASE_DIR}/release-svn.sh && ${BASE_DIR}/sync-svn.sh
}

release_n_sync
