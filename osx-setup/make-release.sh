#!/bin/sh
VERSION=$1

echo "Copying latest build"
mkdir -p osx-pkg/usr/local/bin
mkdir osx-pkg/usr/local/lib
cp ../coinevonet osx-pkg/usr/local/bin
echo "Copying /usr/local/lib/libuv.dylib into package"
cp /usr/local/lib/libuv.dylib osx-pkg/usr/local/lib
# just incase they want to switch networks later
cp ../coinevonet-bootstrap osx-pkg/usr/local/bin

echo "Building package $VERSION"
mkdir -p pkg1
rm pkg1/coinevonet.pkg
pkgbuild --root osx-pkg --scripts scripts --identifier network.coinevo.coinevonet --version $VERSION pkg1/coinevonet.pkg
rm coinevonet-v$VERSION.pkg
productbuild --distribution distribution.xml --resources resources --package-path pkg1 --version $VERSION coinevonet_macos64_installer_v$VERSION.pkg

