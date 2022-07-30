#!/bin/sh
set -e

packageVersion=$(cat package.json \
                | grep version \
                | head -1 \
                | awk -F: '{ print $2 }' \
                | sed 's/[",]//g')

minorVersion=$(echo "$packageVersion" | cut -d "." -f 2)
nextMinorVersion=$(expr $minorVersion + 1)

echo "packageVersion:" $packageVersion
echo "minorVersion:" $minorVersion
echo "nextMinorVersion:" $nextMinorVersion

git tag $packageVersion
git push origin $packageVersion

# bump version
npm version 