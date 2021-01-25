with import <nixpkgs> { };

let
  openocd_src = fetchFromGitHub {
    owner = "raspberrypi";
    repo = "openocd";
    rev = "14c0d0d330bd6b2cdc0605ee9a9256e5627a905e";
    sha256 = "1hdfy7nzcgzs4y68hq6gczh02v75kw4az0hgbzxsvs13796j3fx3";
    fetchSubmodules = true;
  };
  openocd_picoprobe = openocd.overrideAttrs (oldAttrs: rec {
    src = openocd_src;
    configureFlags = oldAttrs.configureFlags ++ [ "--enable-picoprobe" ];
  });

in
stdenv.mkShell rec {
  name = "pico-env";

  nativeBuildInputs = [ pkgconfig ];

  buildInputs = [
    gnumake cmake ninja
    python3
    gcc

    libusb

    openocd_picoprobe

    pkgsCross.arm-embedded.buildPackages.gcc
    pkgsCross.arm-embedded.buildPackages.binutils
  ];
}
