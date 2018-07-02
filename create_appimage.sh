conda create -p AppDir/freecad --file freecad-spec-file.txt
cd AppDir/freecad
rm -rf include
cd lib
rm *.a
cd ..
mv bin bin_tmp
mkdir bin
cp bin_tmp/FreeCAD bin/FreeCAD
cp bin_tmp/activate bin/  
cp bin_tmp/conda bin/  
cp bin_tmp/conda-env bin/
#+ deleting some specific libraries not needed. eg.: stdc++
ARCH=x86_64 appimagetool-x86_64.AppImage AppDir
chmod +x FreeCAD-x86_64.AppImage

