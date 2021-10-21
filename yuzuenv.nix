with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "dolphin-env";

  nativeBuildInputs = [ cmake pkg-config clang-tools ccache ninja llvmPackages_latest.clang ];

  buildInputs = with qt5; [
    libpulseaudio
    libjack2
    alsa-lib
    sndio
    vulkan-loader
    vulkan-headers
    qtbase
    qtwebengine
    qttools
    nlohmann_json
    rapidjson
    zlib
    zstd
    libzip
    lz4
    glslang
    boost173
    catch2
    fmt
    SDL2
    udev
    libusb1
    ffmpeg
    wayland.all
  ];

  shellHook = ''
    export LD_LIBRARY_PATH="${vulkan-loader}/lib:$LD_LIBRARY_PATH";
    export CC="clang";
    export CXX="clang++";
  '';
}
