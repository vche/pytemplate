#!/bin/bash
# set -x

if [ "$1" == "" ]; then
    echo "No project specified"
    echo "Usage: $0 <project name> [<destination>]"
    echo "Default destination is the current folder"
    exit
fi

# Create dest folder if needed
DEST="./"
if [ "$2" != "" ]; then
    DEST=$2
    mkdir -p $DEST
fi
echo "Creating project $1 in $DEST"

# Creating project folder
echo "--> Creating $DEST/$1"
mkdir $DEST/$1

# Copy all files from the template folder (where the script is) and remove the script
echo "--> Copying files"
cp -r $(dirname $0)/* $DEST/$1/
rm -r $DEST/$1/$(basename $0) $DEST/$1/pyvenv 2>/dev/null

echo "--> Updating files"
REPLACE_TOKEN="TEMPLATE_PACKAGE_NAME"
mv $DEST/$1/src/$REPLACE_TOKEN $DEST/$1/src/$1
find $DEST/$1 -type f -exec sed -i '' "s/$REPLACE_TOKEN/$1/g" {} \;

echo "--> Done."
