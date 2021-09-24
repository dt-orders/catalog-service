#!/bin/bash

clear
VERSION=$1

if [ -z "$VERSION" ]
then
    VERSION=1
fi

MAVENSETTINGSFILE="settings.xml"
JFROGMAVENFILE="jfrog-pom.xml"

echo ""
echo "Maven Build Version: $VERSION"
./mvnw clean package -Dmaven.test.skip=true -Dbuildnumber=$VERSION -f $JFROGMAVENFILE

echo ""
echo "Maven Deploy Version: $VERSION to JFrog"
./mvnw deploy -e -Dmaven.test.skip=true -Dbuildnumber="$VERSION" -s $MAVENSETTINGSFILE -f $JFROGMAVENFILE