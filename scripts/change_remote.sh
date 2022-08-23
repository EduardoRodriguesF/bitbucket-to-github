change_remote() {
  pushd $2
    git remote remove origin
    git remote add origin git@github.com:$1/$2.git
    git push -u origin master
  popd
}
