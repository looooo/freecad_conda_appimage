conda create -p AppDir/usr --file freecad-spec-file.txt
cd AppDir/usr
rm -rf include
rm lib/*.a
mv bin bin_tmp
mkdir bin
cp bin_tmp/FreeCAD bin/FreeCAD
cp bin_tmp/activate bin/  
cp bin_tmp/conda bin/  
cp bin_tmp/conda-env bin/
cp bin_tmp/python bin/
rm -rf bin_tmp
#+ deleting some specific libraries not needed. eg.: stdc++
cd ../..
ls
ARCH=x86_64 ./appimagetool-x86_64.AppImage AppDir
chmod +x FreeCAD-x86_64.AppImage

