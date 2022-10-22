with import <nixpkgs> { };

mkShell {
  name = "yuzu-env";

  nativeBuildInputs = [ cmake pkg-config clang-tools ccache ninja llvmPackages_14.clang ];

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
    libva
    lz4
    glslang
    boost173
    catch2
    fmt_8
    SDL2
    udev
    libusb1
    ffmpeg
    wayland.all
    pipewire
  ];

  shellHook = ''
    export LD_LIBRARY_PATH="${vulkan-loader}/lib:$LD_LIBRARY_PATH";
    export CC="clang";
    export CXX="clang++";
  '';
}
