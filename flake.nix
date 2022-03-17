{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }: utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.imx_usb_loader = pkgs.callPackage ./imx_usb_loader.nix { };
      packages.firefox-de = pkgs.callPackage ./firefox-devedition.nix { };
      devShells.linux = pkgs.callPackage ./linuxenv.nix { };
      devShells.dolphin = pkgs.callPackage ./dolphinenv.nix { };
      devShells.zephyr = pkgs.callPackage ./zephyrenv.nix { };
      apps.ctf = utils.lib.mkApp { drv = pkgs.callPackage ./ctfenv.nix { }; };
    });
}
