clone_from_bitbucket() {
  git clone git@bitbucket.org:econverse-ag/$1.git
}

change_remote() {
  pushd $1
    git remote remove origin
    git remote add origin git@github.com:EconverseAG/$1.git
    git push -u origin master
  popd
}
