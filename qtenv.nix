with import <nixpkgs> { };

buildFHSUserEnv {
  name = "qtenv";
  targetPkgs = pkgs: with pkgs; [
    file
    gdb
    git
    netcat
    strace
    udev
    watch
    wget
    utillinux
    gnupg
    netcat
    ncurses
    which
    bash
    qt5.full
    zlib
    dbus
    pulseaudio
    glib
    libGL
  ] ++ (with xlibs; [
    libxcb
    libXcomposite
    libXcursor
    libXdamage
    libXfixes
    libXft
    libXScrnSaver
  ]) ++ (with xorg; [
    libX11
    libXext
    libXi
    libXmu
    libXp
    libXpm
    libXrandr
    libXrender
    libXt
    libXtst
    libXxf86vm
  ]);
  runScript = "bash";

  profile = "export QT_PLUGIN_PATH=${pkgs.qt512.full}/lib/qt-5.12/plugins/;";
}
