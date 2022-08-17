change_remote(repo) {
  pushd $repo
    git remote remove origin
    git remote add origin git@github.com:EconverseAG/$repo.git
    git push -u origin master
  popd
}
