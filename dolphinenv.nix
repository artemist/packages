with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "dolphin-env";

  nativeBuildInputs = [ cmake pkgconfig clang-tools ccache clang_9 ];

  buildInputs = with xorg; with xlibs; [
    curl ffmpeg libao libGLU pcre gettext libpthreadstubs libpulseaudio
    libXrandr libXext libXi libXxf86vm libXinerama libSM readline openal libXdmcp lzo
    portaudio libusb libpng hidapi miniupnpc enet mbedtls soundtouch sfml
    mbedtls git pugixml python38
    llvm_9
    bluezFull udev libevdev alsaLib vulkan-loader
    # ((qt5.override { developerBuild = true; }).full)
    qt5.full
    libffi
    wayland.all
    ninja
  ];

  shellHook = ''
    export LD_LIBRARY_PATH="${vulkan-loader}/lib:$LD_LIBRARY_PATH";
    export CC="clang";
    export CXX="clang++";
  '';
}
