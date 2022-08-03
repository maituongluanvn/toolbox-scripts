#!/bin/sh
set -e
# source ./table.sh
# get latest source code from master
git reset --hard origin/master

packageVersion=$(cat ../package.json \
                | grep version \
                | head -1 \
                | awk -F: '{ print $2 }' \
                | sed 's/[",]//g')

# tag package
git tag $packageVersion
git push origin $packageVersion

# bump version
nextMinorVersion=$(echo $(npm version minor) | cut -d "v" -f 2)

# delete local redundant tag
# git tag -d "v$nextMinorVersion"

# git push

packageName=$(npm run env | grep "npm_package_name" | awk -F "=" '{print $2}')

echo -n "Package name:" $packageName
echo -n "Current package version:" $packageVersion
echo -n "Next package version:" $nextMinorVersion