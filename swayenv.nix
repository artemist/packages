with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "sway-env";

  nativeBuildInputs = [ pkgconfig meson ninja scdoc wayland ];

  buildInputs = with xorg; with xlibs; [
    wayland
    libxkbcommon
    pcre
    json_c
    dbus
    libevdev
    pango
    cairo
    libinput
    libcap
    pam
    gdk-pixbuf
    wayland-protocols
    pixman
    xcbutilwm
    libX11
    xcbutilimage
    xcbutilerrors
    mesa
    libpng
    ffmpeg_4
  ];
}
