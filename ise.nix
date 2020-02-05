with import <nixpkgs> { };

buildFHSUserEnv {
  name = "ise-fhs-env";
  targetPkgs = pkgs: with pkgs; [
    bash
    zlib
    glib
    glib-networking
    libpng12
    freetype
    fontconfig
    gtk2
    xlibs.libSM
    xlibs.libICE
    xlibs.libXrender
    xlibs.libXrandr
    xlibs.libXext
    xlibs.libX11
    xlibs.libXi
    xlibs.libXcursor
    xlibs.libXdmcp
    ncurses5
    libusb
    libuuid
  ];
}

