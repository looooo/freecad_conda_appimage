#1 create a new environment in the AppDir
conda create \
    -p AppDir/usr \
    freecad blas=*=openblas \
    --copy \
    --no-default-packages \
    -c freecad/label/dev \
    -c conda-forge \
    -y

# activating the environment to install additional tools
# this can be skipped if we create conda-packages from the pip-packages...
source activate AppDir/usr
pip install https://github.com/looooo/freecad_pipintegration/archive/master.zip
source activate base

## this will create a huge env. We have to find some ways to make the env smaller
## deleting some packages explicitly?
conda remove -p AppDir/usr --force -y \
    ruamel_yaml conda system tk json-c llvmdev \
    nomkl openssl readline xorg-fixesproto xorg-libsm mesalib \
    xorg-libx11 curl gstreamer libtheora asn1crypto certifi chardet \
    gst-plugins-base idna kiwisolver pycosat pycparser pysocks \
    pytz sip solvespace tornado xorg-libxi xorg* cffi \
    cycler python-dateutil setuptools cryptography pyqt soqt wheel \
    pyopenssl requests pyparsing libstdcxx-ng \
    xz sqlite pyparsing ncurses


conda list -p AppDir/usr

#2 delete unnecessary stuff
rm -rf AppDir/usr/include
find AppDir/usr -name \*.a -delete
mv AppDir/usr/bin AppDir/usr/bin_tmp
mkdir AppDir/usr/bin
cp AppDir/usr/bin_tmp/FreeCAD AppDir/usr/bin/FreeCAD
cp AppDir/usr/bin_tmp/python AppDir/usr/bin/
rm -rf AppDir/usr/bin_tmp
#+ deleting some specific libraries not needed. eg.: stdc++

#3 create the appimage
wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
chmod +x appimagetool-x86_64.AppImage
./appimagetool-x86_64.AppImage --appimage-extract

ARCH=x86_64 squashfs-root/AppRun  AppDir

#4 setting rights for the appimage
chmod +x FreeCAD-x86_64.AppImage

#5 delete the created environment
rm -rf AppDir/usr
rm -rf squashfs-root/
rm -rf appimagetool-x86_64.AppImage

printf "############## APPIMAGE-FILE-SIZE ################\n"
stat --printf="%s" FreeCAD-x86_64.AppImage
printf "\n##################################################\n"
