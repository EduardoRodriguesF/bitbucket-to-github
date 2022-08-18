rm -Rf tmp
mkdir tmp

echo "Listing repositories..."
touch tmp/repos.txt
ruby list_repos.rb > tmp/repos.txt
