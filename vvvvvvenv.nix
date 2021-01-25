with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "vvvvvv-env";

  nativeBuildInputs = [ cmake pkgconfig ninja valgrind ccache clang_9 llvm_9 ];

  buildInputs = [
    SDL2
    SDL2_mixer
  ];
}
