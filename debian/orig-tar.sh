#!/bin/sh

#usage:
#./orig-tar.sh VALIDATOR_1_6_RC1
#./orig-tar.sh STRUTS_1_1_B1

set -e
SVN_URL=https://svn.apache.org/repos/asf/commons/_moved_to_git/validator
PACKAGE=$(dpkg-parsechangelog -S Source)
VERSION=$1
TAR=../${PACKAGE}_${VERSION}.orig.tar.xz
DIR=${PACKAGE}_${VERSION}
TAG=$VERSION

echo "Available tags: "
svn ls $SVN_URL/tags

svn export $SVN_URL/tags/${TAG} $DIR
XZ_OPT=--best tar -c -J -f $TAR $DIR
rm -rf $DIR ../$TAG
echo Compressed file locates at $TAR

