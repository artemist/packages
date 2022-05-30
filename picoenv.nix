with import <nixpkgs> { };
let
  sdk_src = fetchFromGitHub {
    fetchSubmodules = true;
    owner = "raspberrypi";
    repo = "pico-sdk";
    rev = "1.3.1";
    sha256 = "sha256-Xf8QSQIe7XCMunljioC5/MhXcuTmyN7J6pPQFM3ico8=";
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
