with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "linux-env";

  nativeBuildInputs = [ pkgconfig ];

  buildInputs = [
    bc
    bison
    cpio
    elfutils
    flex
    gmp
    gnumake
    libmpc
    mpfr
    ncurses
    nettools
    openssl
    perl
    python3

    binutils
    gcc
    pkgsCross.aarch64-multiplatform.buildPackages.binutils
    pkgsCross.aarch64-multiplatform.buildPackages.gcc
    gcc-arm-embedded
  ];
}
