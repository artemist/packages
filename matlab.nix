with import <nixpkgs> { };

buildFHSUserEnv {
  name = "matlab";
  targetPkgs = pkgs: with pkgs; [
    bash
    alsaLib
    atk
    aws-sdk-cpp
    curl
    dbus_daemon.lib
    file
    firefox
    fontconfig.lib
    gcc6
    gdk_pixbuf
    git
    glib
    gnome2.gtk
    gnome2.pango
    icu
    jansson
    libcap_progs.lib
    libGL
    libselinux
    linux-pam
    llvmPackages.openmp
    lz4
    mesa_glu
    ncurses
    nspr
    openssl
    python35Full
    python36Full
    scilab-bin
    udev
    xlibs.libxcb
    xlibs.libXcomposite
    xlibs.libXcursor
    xlibs.libXdamage
    xlibs.libXfixes
    xlibs.libXft
    xlibs.libXScrnSaver
    xorg.libX11
    xorg.libXext
    xorg.libXi
    xorg.libXmu
    xorg.libXp
    xorg.libXpm
    xorg.libXrandr
    xorg.libXrender
    xorg.libXt
    xorg.libXtst
    xorg.libXxf86vm
    zlib
  ];

  runScript = "/home/artemis/.local/matlab/bin/matlab";
}
