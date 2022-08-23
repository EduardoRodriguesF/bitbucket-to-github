source "./scripts/clone_from_bitbucket.sh"
source "./scripts/change_remote.sh"

pwd="$(pwd)"

export $(cat $pwd/.env.local | xargs)

rm -Rf tmp
mkdir tmp

echo "Listing repositories..."
touch tmp/repos.txt
ruby list_repos.rb > tmp/repos.txt

create_repository() {
  curl -X POST -H "Accept: application/vnd.github+json" -H "Authorization: token $GITHUB_PERSONAL_TOKEN" https://api.github.com/orgs/EconverseAG/repos -d "{\"name\":\"$1\",\"private\":true}" 
}

pushd tmp
  while read p; do
    ruby $pwd/github_repository_exists.rb $p

    if [[ $? -eq 0 ]]; then
      continue
    fi


    clone_from_bitbucket $BITBUCKET_WORKSPACE $p

    create_repository $GITHUB_ORGANIZATION $p

    change_remote $p

    rm -Rf $p
  done < repos.txt
popd
