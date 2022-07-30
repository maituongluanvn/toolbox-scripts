#!/bin/sh
set -e

packageVersion=$(cat package.json \
                | grep version \
                | head -1 \
                | awk -F: '{ print $2 }' \
                | sed 's/[",]//g')

minorVersion=$(echo "$packageVersion" | cut -d "." -f 2)

# increase minor
# nextMinorVersion=$(expr $minorVersion + 1)

echo "packageVersion:" $packageVersion
echo "minorVersion:" $minorVersion
# echo "nextMinorVersion:" $nextMinorVersion

# git tag $packageVersion
# git push origin $packageVersion

# get latest source code from master
git reset --hard origin/master

# bump version
nextMinorVersion=$(echo $(npm version minor) | cut -d "v" -f 1)
npm version $nextMinorVersion
# delete local redundant tag
git tag -d $nextMinorVersion

echo $nextMinorVersion

