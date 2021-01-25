with import <nixpkgs> { };
let llvmPackages = llvmPackages_9;
in
stdenv.mkDerivation rec {
  name = "sequoia-env";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = with xorg; with xlibs; [
    llvmPackages.clang
    llvmPackages.llvm
    git
    gnumake
    nettle
    openssl
    capnproto
    sqlite
    (python38.withPackages (p: with p; [ pip setuptools cffi pytest ]))
  ];

  shellHook = ''
    export LIBCLANG_PATH="${llvmPackages.libclang}/lib";
    export CC=clang;
    export CXX=clang++;
  '';
}
