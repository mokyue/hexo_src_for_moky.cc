function release_n_sync
{
    BASE_DIR=$(cd `dirname $0` && pwd)
    ${BASE_DIR}/release-git.sh && ${BASE_DIR}/sync-git.sh
}

release_n_sync
