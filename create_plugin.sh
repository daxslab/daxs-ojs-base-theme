#! /usr/bin/env sh

rm daxsBase.tar.gz
mkdir daxsBase
cp -r * daxsBase/
rm -R daxsBase/daxsBase
tar -cvzf daxsBase.tar.gz --exclude='*.sh' --exclude='less' --exclude='*.md' --exclude='LICENSE' daxsBase
rm -R daxsBase