#1 create a new environment in the AppDir with packages specified with a text-file
conda create -p AppDir/usr --file freecad-spec-file.txt --copy

#2 delete unnecessary stuff
rm -rf AppDir/usr/include
rm AppDir/usr/lib/*.a
mv AppDir/usr/bin AppDir/usr/bin_tmp
mkdir AppDir/usr/bin
cp AppDir/usr/bin_tmp/FreeCAD AppDir/usr/bin/FreeCAD
cp AppDir/usr/bin_tmp/activate AppDir/usr/bin/  
cp AppDir/usr/bin_tmp/python AppDir/usr/bin/
cp AppDir/usr/bin_tmp/widget.py AppDir/usr/bin/
rm -rf AppDir/usr/bin_tmp
#+ deleting some specific libraries not needed. eg.: stdc++

#3 create the appimage
ARCH=x86_64 ./appimagetool-x86_64.AppImage AppDir

#4 setting rights for the appimage
chmod +x FreeCAD-x86_64.AppImage

#5 delete the created environment
rm -rf AppDir/usr
