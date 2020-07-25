with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "linux-env";

  nativeBuildInputs = [ pkgconfig ];

  buildInputs = [
    gnumake
    flex bison gmp libmpc mpfr
    libelf ncurses
    nettools bc libelf cpio openssl perl
  ];
}
