#! /bin/bash

# Bundles the files in this repository up for release.
#
# Usage: ./scripts/make-release.sh <VERSION>
#
# The resulting release package will be in release/preview/<PACKAGE>/<VERSION>.

# For local testing, just run ./scripts/make-release.sh VERSION
# To prepare a public release, run ./scripts/make-release.sh VERSION --update-readme


VERSION=$1

if [ -z "$VERSION" ];
then
    echo "You need to specify a version number."
    exit 1
fi

RELEASE_DIR=release/preview/bananote/$VERSION


if [[ "$2" == "--update-readme" ]]; then
    # Update occurrences of version in the README, but only if requested
    echo "Updating README to version $VERSION."
    sed -i '.bak' -e "s/preview\/bananote:[^\"]*/preview\/bananote:$VERSION/" README.md

    # Update version in blank.typ
    echo "Updating blank.typ to version $VERSION."
    sed -i '.bak' -e "s/preview\/bananote:[^\"]*/preview\/bananote:$VERSION/" template/blank.typ
fi

# Put together release
rm -rf $RELEASE_DIR
mkdir -p $RELEASE_DIR/template

cp lib.typ $RELEASE_DIR/lib.typ
cp README.md $RELEASE_DIR/README.md
cp LICENSE $RELEASE_DIR/LICENSE
cp template/thumbnail.png $RELEASE_DIR/
cp template/blank.typ $RELEASE_DIR/template/main.typ

# replace version in typst.toml
sed "s/VERSION/$VERSION/g" template/typst-template.toml > $RELEASE_DIR/typst.toml

echo "Package is ready for release in $RELEASE_DIR."