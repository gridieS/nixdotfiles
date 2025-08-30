{ config, lib, pkgs, ... }:

{
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.openFirewall = true;  

  services.flatpak.enable = true;
}
