with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "linux-env";

  nativeBuildInputs = [ pkgconfig ];

  buildInputs = [
    gnumake
    gcc
    binutils
    flex
    bison
    gmp
    libmpc
    mpfr
    libelf
    ncurses
    nettools
    bc
    libelf
    cpio
    openssl
    perl
  ];
}
