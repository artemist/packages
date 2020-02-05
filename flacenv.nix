with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "flac-env";

  nativeBuildInputs = [ pkgconfig autoconf automake libtool clang_9 ];

  buildInputs = [
    gettext libogg
  ];

  shellHook = ''
    export CC="clang";
    export CXX="clang++";
  '';
}
