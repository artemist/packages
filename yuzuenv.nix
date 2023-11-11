with import <nixpkgs> { };

let
  qt = qt5;
  qtPlugins = with qt; [ qtbase qtwayland qttools qtwebengine ];
  pluginPath = lib.makeSearchPath
    qt.qtbase.qtPluginPrefix
    (builtins.map lib.getBin qtPlugins);
  qmlPath = lib.makeSearchPath
    qt.qtbase.qtQmlPrefix
    (builtins.map lib.getBin qtPlugins);

in
mkShell {
  name = "yuzu-env";

  nativeBuildInputs = [ cmake pkg-config clang-tools ccache ninja llvmPackages_14.clang gdb ];

  buildInputs = [
    SDL2
    alsa-lib
    boost173
    catch2
    enet
    ffmpeg
    fmt_9
    glslang
    libjack2
    libpulseaudio
    libusb1
    libva
    libzip
    lz4
    nlohmann_json
    pipewire
    rapidjson
    sndio
    udev
    vulkan-headers
    vulkan-loader
    wayland.all
    zlib
    zstd
  ] ++ qtPlugins;


  LD_LIBRARY_PATH = "${vulkan-loader}/lib:$LD_LIBRARY_PATH";
  QT_PLUGIN_PATH = "${pluginPath}";
  QML2_IMPORT_PATH = "${qmlPath}";
  shellHook = ''
    export CC="clang";
    export CXX="clang++";
  '';
}
