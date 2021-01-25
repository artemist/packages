with import <nixpkgs> { };
let
  openocd_src = fetchFromGitHub {
    owner = "raspberrypi";
    repo = "openocd";
    rev = "14c0d0d330bd6b2cdc0605ee9a9256e5627a905e";
    sha256 = "1hdfy7nzcgzs4y68hq6gczh02v75kw4az0hgbzxsvs13796j3fx3";
    fetchSubmodules = true;
  };
  sdk_src = fetchFromGitHub {
    owner = "raspberrypi";
    repo = "pico-sdk";
    fetchSubmodules = true;
    rev = "0f3b7951167cf672afdcb34a58ddd0e363ae886f";
    sha256 = "1mq66v8dndjsv8ddkmphb2bhmgjnsyqb142f1hbqlckqzra2vqml";
  };
  openocd_picoprobe = openocd.overrideAttrs (oldAttrs: rec {
    src = openocd_src;
    configureFlags = oldAttrs.configureFlags ++ [ "--enable-picoprobe" ];
  });
in
mkShell rec {
  name = "pico-env";

  nativeBuildInputs = [ pkgconfig ];

  buildInputs = [
    gnumake
    cmake
    ninja
    python3
    gcc
    libusb
    openocd_picoprobe
    gcc-arm-embedded
  ];

  PICO_SDK_PATH = sdk_src;
}
