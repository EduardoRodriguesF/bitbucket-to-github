clone_from_bitbucket() {
  local workspace=$1
  local repository=$2

  git clone git@bitbucket.org:$workspace/$repository.git
}
