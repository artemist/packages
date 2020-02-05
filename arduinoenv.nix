with import <nixpkgs> { };

buildFHSUserEnv {
  name = "arduinoenv";
  targetPkgs = pkgs: with pkgs; [
    arduino
    avrdude
  ];
}

