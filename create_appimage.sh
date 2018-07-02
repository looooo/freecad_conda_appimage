conda create -p AppDir/freecad --file freecad-spec-file.txt
ARCH=x86_64 appimagetool-x86_64.AppImage AppDir
chmod +x FreeCAD-x86_64.AppImage

