# Build with `nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=iso.nix`
{config, pkgs, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix>
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    blacklistedKernelModules = [ "nouveau" ];
  };
  environment.systemPackages = with pkgs; [
    htop tmux neovim
    lsof
    binutils-unwrapped  # for strings
  ];
}
