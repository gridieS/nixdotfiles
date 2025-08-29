# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #./imports/graphics.nix
      ./imports/networking.nix
      ./imports/services.nix
      ./imports/programs.nix
      ./imports/desktop.nix
    ];

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Locale
  time.timeZone = "Asia/Jerusalem";

  i18n.defaultLocale = "en_IL";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "he_IL.UTF-8";
    LC_IDENTIFICATION = "he_IL.UTF-8";
    LC_MEASUREMENT = "he_IL.UTF-8";
    LC_MONETARY = "he_IL.UTF-8";
    LC_NAME = "he_IL.UTF-8";
    LC_NUMERIC = "he_IL.UTF-8";
    LC_PAPER = "he_IL.UTF-8";
    LC_TELEPHONE = "he_IL.UTF-8";
    LC_TIME = "he_IL.UTF-8";
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.peer = {
    isNormalUser = true;
    description = "peer";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.nano.enable = false;
  environment.systemPackages = with pkgs; [
    firefox
    vim
    wget
    flatpak
    docker
    home-manager
    dconf
    gnome-extension-manager
    gh

    gnomeExtensions.clipboard-history
    gnomeExtensions.search-light
    gnomeExtensions.space-bar
    gnomeExtensions.tray-icons-reloaded
  ];
  programs.firefox.nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];

  system.stateVersion = "25.05"; # NixOS package versions

}
