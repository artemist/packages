with import <nixpkgs> { }; 
mkShell rec {
  version = "4.2.0";
  pname = "darktable";

  nativeBuildInputs = [ cmake ninja llvm_13 pkg-config intltool perl desktop-file-utils wrapGAppsHook ];

  buildInputs = [
    cairo
    curl
    exiv2
    glib
    glib-networking
    gtk3
    ilmbase
    lcms2
    lensfun
    libexif
    libgphoto2
    libjpeg
    libpng
    librsvg
    libtiff
    libjxl
    openexr_3
    sqlite
    libxslt
    libsoup
    graphicsmagick
    json-glib
    openjpeg
    pugixml
    libwebp
    libsecret
    SDL2
    gnome.adwaita-icon-theme
    osm-gps-map
    pcre
    isocodes
    gmic
    libavif
    icu
    jasper
    libheif
    libaom
    portmidi
    lua
    colord
    colord-gtk
    xorg.libX11
    ocl-icd
    gdb
  ];
}
