source "./scripts/clone_from_bitbucket.sh"
source "./scripts/change_remote.sh"

pwd="$(pwd)"

rm -Rf tmp
mkdir tmp

echo "Listing repositories..."
touch tmp/repos.txt
ruby list_repos.rb > tmp/repos.txt

pushd tmp
  while read p; do
    ruby $pwd/github_repository_exists.rb $p

    if [[ $? -eq 0 ]]; then
      continue
    fi

    clone_from_bitbucket $p
  done < repos.txt
popd
