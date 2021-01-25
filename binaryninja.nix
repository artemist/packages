with import <nixpkgs> { };
let
  qt = pkgs.qt5.full;
  binjaDir = "/home/artemis/.local/applications/binaryninja";
  fhsEnv = buildFHSUserEnv {
    name = "binaryninja-fhs-env";
    targetPkgs = pkgs: with pkgs; [
      # Tools
      (python27Full.withPackages (ps: [ python37Packages.pip python37Packages.pygments ]))
      (python38Full.withPackages (ps: [ python37Packages.pip python37Packages.pygments ]))
      bash
      curlFull
      git

      # Libraries
      alsaLib
      dbus
      expat
      fontconfig
      freetype
      gcc-unwrapped
      glib
      gtk3
      icu
      krb5
      libGL
      libxkbcommon
      ncurses
      nspr
      nssTools
      qt
      xlibs.libxcb
      xorg.libX11
      xorg.libXcomposite
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
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
  };
  desktopItem = makeDesktopItem {
    name = "binaryninja";
    exec = "binaryninja %f";
    icon = "${binjaDir}/docs/img/logo.png";
    type = "Application";
    desktopName = "Binary Ninja";
    genericName = "binja";
  };

in
runCommand "binaryninja" { } ''
  mkdir -p $out/bin $out/share/applications
  cat >$out/bin/binaryninja <<EOF
  #!${bash}/bin/bash

  test -f ${binjaDir}/qt.conf.old || cp ${binjaDir}/qt.conf ${binjaDir}/qt.conf.old
  # cp ${qt}/bin/qt.conf ${binjaDir}/qt.conf
  # ${fhsEnv}/bin/binaryninja-fhs-env -c "LD_LIBRARY_PATH=\"${binjaDir}:\$LD_LIBRARY_PATH\" ${binjaDir}/binaryninja \$*"
  exec ${fhsEnv}/bin/binaryninja-fhs-env -c "${binjaDir}/binaryninja \$*"
  EOF

  chmod +x $out/bin/binaryninja

  cat >$out/bin/scc <<EOF
  #!${bash}/bin/bash
  ${fhsEnv}/bin/binaryninja-fhs-env -c "${binjaDir}/plugins/scc \$*"
  EOF
  chmod +x $out/bin/scc

  cp ${desktopItem}/share/applications/* $out/share/applications/
''
