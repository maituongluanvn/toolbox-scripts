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
npm version minor
nextMinorVersion=$($(npm version minor))
echo $nextMinorVersion

