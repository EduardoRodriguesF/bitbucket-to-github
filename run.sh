source "./scripts/clone_from_bitbucket.sh"
source "./scripts/change_remote.sh"

rm -Rf tmp
mkdir tmp

echo "Listing repositories..."
touch tmp/repos.txt
ruby list_repos.rb > tmp/repos.txt

pushd tmp
  while read p; do
    clone_from_bitbucket $p
  done < repos.txt
popd
