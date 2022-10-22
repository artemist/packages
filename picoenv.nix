with import <nixpkgs> { };
let
  sdk_src = fetchFromGitHub {
    fetchSubmodules = true;
    owner = "raspberrypi";
    repo = "pico-sdk";
    rev = "1.4.0";
    sha256 = "sha256-i3IAaNcd0EfKNvU104a776O1poDAChlx1m+nP8iFn8E=";
  };
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
    openocd
    gcc-arm-embedded
  ];

  PICO_SDK_PATH = sdk_src;
}
