with import <nixpkgs> { };

buildFHSUserEnv {
  name = "quartus-fhs-env";
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
    xlibs.libXrender
    xlibs.libXext
    xlibs.libX11
    xlibs.libXext
    xlibs.libXrender
  ];

  # runScript = "/home/artemis/.local/matlab/bin/matlab";
}

