{ pkgs }: with pkgs;
buildFHSUserEnv {
  name = "ctfenv";
  targetPkgs = pkgs: with pkgs; [
    file
    gdb
    pwndbg
    git
    netcat
    strace
    udev
    watch
    wget
    utillinux
    gnupg
    netcat
    ncurses
    python27
    python37
    busybox
    libseccomp
    fish
    zsh
  ];
}
