with import <nixpkgs> { };

stdenv.mkDerivation rec {
  pname = "imx_usb_loader";
  version = "2020-01-04";

  src = fetchFromGitHub {
    owner = "boundarydevices";
    repo = "imx_usb_loader";
    rev = "f009770d841468204ab104bf7d3b0c5bc8425dbb";
    sha256 = "14yf9kfxrg3pxs6pwhds7z2mn78mch8nyk21myalr3m55bxkif9k";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ libusb ];

  buildPhase = ''
    make imx_usb imx_uart
  '';

  installPhase = ''
    make install prefix=$out
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/boundarydevices/imx_usb_loader;
    license = licenses.lgpl21;
    description = "USB & UART loader for i.MX5/6/7/8 series";
    maintainers = with maintiners; [ artemist ];
    platforms = platforms.linux;
  };
}
