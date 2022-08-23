change_remote() {
  local organization=$1
  local repository=$2

  pushd $repository
    git remote remove origin
    git remote add origin git@github.com:$organization/$repository.git
    git push -u origin master
  popd
}
