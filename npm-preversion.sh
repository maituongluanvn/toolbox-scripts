#!/bin/sh
set -e

# get latest source code from master
git reset --hard origin/master

packageVersion=$(cat package.json \
                | grep version \
                | head -1 \
                | awk -F: '{ print $2 }' \
                | sed 's/[",]//g')

minorVersion=$(echo "$packageVersion" | cut -d "." -f 2)

# tag package
git tag $packageVersion
git push origin $packageVersion

# bump version
nextMinorVersion=$(echo $(npm version minor) | cut -d "v" -f 2)
# delete local redundant tag
git tag -d "v$nextMinorVersion"

echo "aaaaaaaaaa:" $nextMinorVersion
echo "packageVersion:" $packageVersion
echo "minorVersion:" $minorVersion