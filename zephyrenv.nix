with import <nixpkgs> { };

let
  zephyr-sdk = stdenv.mkDerivation rec {
    pname = "zephyr-sdk";
    version = "0.13.1";

    nativeBuildInputs = [
      python38
      autoPatchelfHook # We can use normal autopatchelf since all the binaries in sysroots are static
      which
    ];

    src =
      if stdenv.hostPlatform.system == "x86_64-linux" then
        fetchurl
          {
            url = "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${version}/zephyr-sdk-${version}-linux-x86_64-setup.run";
            sha256 = "14bbzq4as4kgk5s3z41pvdz6221agwkh76q21npzfvvkkz96lb38";
          }
      else if stdenv.hostPlatform.system == "aarch64-linux" then
        fetchurl
          {
            url = "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${version}/zephyr-sdk-${version}-linux-aarch64-setup.run";
            sha256 = "1s0y5njccm3xsm3baah6mgglywxwg37zjrfcbr3zzycsxhn901qc";
          }
      else
        throw "Unsupported system: ${stdenv.hostPlatform.system}";

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      # Extract outer self-extracting archive
      cp $src $TEMP/installer.run
      chmod +x $TEMP/installer.run
      $TEMP/installer.run --noexec --target $TEMP/outer

      # Run the setup tool
      cd $TEMP/outer
      bash ./setup.sh -d $out -y -norc -nocmake

      runHook postInstall
    '';

    meta = with lib; {
      homepage = "https://www.zephyrproject.org/";
      description = "Collection of compilers and tools for the Zephyr RTOS";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" "aarch64-linux" ];
      maintainers = with maintainers; [ artemist ];
    };
  };
  esp-idf = fetchFromGitHub {
    owner = "espressif";
    repo = "esp-idf";
    rev = "v4.3.1";
    sha256 = "1pafcylpp8ladmkb24g78fzridiw5g3j21jspdbgf5kpk6gi76qk";
    leaveDotGit = true;
    fetchSubmodules = true;
  };
  xtensa-esp32-elf = stdenv.mkDerivation rec {
    pname = "xtensa-esp32-elf-gcc";
    version = "2021r1";
    src = builtins.fetchTarball {
      url = "https://github.com/espressif/crosstool-NG/releases/download/esp-2021r1/xtensa-esp32-elf-gcc8_4_0-esp-2021r1-linux-amd64.tar.gz";
      sha256 = "1xdcskwkrg15kphjqv1nwb1xvmsbc411vibk8jfj3x75p81s9cgs";
    };

    nativeBuildInputs = [
      autoPatchelfHook
    ];

    buildInputs = [
      python27
      gcc-unwrapped.lib
    ];

    installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp -R $src $out/xtensa-esp32-elf
      runHook postInstall
    '';
  };

in
mkShell rec {
  packages = [
    cmake
    ninja
    gnumake
    dtc
    python3
  ] ++ (with python3.pkgs; [
    west
    # requirements-base.txt
    pyelftools
    pykwalify
    pyyaml
    canopen
    packaging
    progress
    psutil
    pylink-square
    anytree
    intelhex
  ]);

  ZEPHYR_TOOLCHAIN_VARIANT = "zephyr";
  ZEPHYR_SDK_INSTALL_DIR = "${zephyr-sdk}";
  ZEPHYR_BASE = "/home/artemis/repos/public/zephyr/zephyr";
  ESP_IDF_PATH = "${esp-idf}";
  ESPRESSIF_TOOLCHAIN_PATH = "${xtensa-esp32-elf}/xtensa-esp32-elf";
}
