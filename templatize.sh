#!/bin/bash
# set -x

update_project()
{
    echo "--> Creating virtual env"
    virtualenv pyvenv;
    . pyvenv/bin/activate;
    echo "--> Installing test and doc depedencies"
    pip install tox sphinx sphinx_rtd_theme pip install m2r
    echo "--> Generating test modules"
    sphinx-apidoc -f -o docs/sphinx_conf/source/ src/$1
    git init
    deactivate
}

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
cp -r $(dirname $0)/.gitignore $DEST/$1/
rm -r $DEST/$1/$(basename $0) $DEST/$1/pyvenv 2>/dev/null

echo "--> Updating files"
REPLACE_TOKEN="TEMPLATE_PACKAGE_NAME"
mv $DEST/$1/src/$REPLACE_TOKEN $DEST/$1/src/$1
find $DEST/$1 -type f -exec sed -i '' "s/$REPLACE_TOKEN/$1/g" {} \;

# Setting up dev env
(cd $DEST/$1; update_project $1 )

echo "--> Done."
