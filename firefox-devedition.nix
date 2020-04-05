with import <nixpkgs> { };
let
  unwrappedFirefox = pkgs.firefox-devedition-bin-unwrapped.override { systemLocale = "de-DE"; };
in
  pkgs.wrapFirefox unwrappedFirefox {
    browserName = "firefox";
    desktopName = "Firefox";
    gdkWayland = true;
    pname = "firefox-bin";
  }
