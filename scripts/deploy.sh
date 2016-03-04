#!/bin/bash
echo "Running deployment script..."

RELEASE_DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo "Pre-Release: ($RELEASE_DATE)" > CHANGELOG.md
git log `git describe --tags --abbrev=0 HEAD^`..HEAD --pretty=format:"- %s;%n" >> CHANGELOG.md
releaseLog="$(cat CHANGELOG.md)"

read -p "Press any key to run update-bundle.sh"

./update-bundle.sh

read -p "Press any key to commit"
git commit -a -m "updating version & release notes"
read -p "Press any key to tag"
git tag $buildVersionFull
read -p "Press any key to push tags"
git push origin --tags
read -p "Press any key to push master"
git push origin master

echo "Pushed deployment successfully"
exit 0
