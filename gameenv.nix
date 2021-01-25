with import <nixpkgs> { };

buildFHSUserEnv {
  name = "gameenv";
  targetPkgs = pkgs: with pkgs; [
    python27
    python37

    SDL2
    cairo
    expat
    fontconfig
    freetype
    gcc-unwrapped.lib
    gdk-pixbuf
    glib
    gtk2-x11
    gtk3
    libGL
    libao
    libpulseaudio
    udev
    vulkan-loader
    xlibs.libICE
    xlibs.libSM
    xlibs.libX11
    xlibs.libXcomposite
    xlibs.libXcursor
    xlibs.libXdamage
    xlibs.libXext
    xlibs.libXfixes
    xlibs.libXi
    xlibs.libXrandr
    xlibs.libXrender
    xlibs.libXtst
    xlibs.libxcb
    zlib
  ];
}
