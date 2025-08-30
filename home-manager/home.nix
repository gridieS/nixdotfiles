{ config, pkgs, lib, ... }:

{
  home.username = "peer";
  home.homeDirectory = "/home/peer";

  nixpkgs.config.allowUnfree = true;
  home.packages = [
    pkgs.htop          # A popular process viewer
    pkgs.fastfetch      # A system information tool
    pkgs.alacritty
    pkgs.beeper
    pkgs.vesktop
    pkgs.firefoxpwa
    pkgs.vscode

  ];

  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [
      pkgs.firefoxpwa
    ];
  };
  
  home.file.".config/alacritty/alacritty.toml".source = dotfiles/alacritty.toml;

  # Manage configuration for Git.
  programs.git = {
    enable = true;
    # Configure your user name and email.
    userName = "gridieS";
    userEmail = "gridieworks@gmail.com";
  };
  

  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      show-all-sources = true;
      sources = [(lib.gvariant.mkTuple [ "xkb" "us" ]) (lib.gvariant.mkTuple [ "xkb" "il" ])];
      xkb-options = [ "terminate:ctrl_alt_bksp" "grp:alt_shift_toggle" ];
    };
    "org/gnome/desktop/peripherals/keyboard" = {
      delay = lib.gvariant.mkUint32 228;
      repeat-interval =  lib.gvariant.mkUint32 24;
    };
    "org/gnome/desktop/interface" = {
      accent-color = "teal";
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = false;
    };
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 6;
    };
    "org/gnome/mutter" = {
      overlay-key = "";
    };
    "org/gnome/desktop/wm/keybindings" = {
      minimize = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
      switch-applications = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
      switch-windows = ["<Super>h" "<Alt>Tab"];
      switch-windows-backward = ["<Shift><Alt>Tab"];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-5 = [ "<Super>5" ];
      switch-to-workspace-6 = [ "<Super>6" ];
      move-to-workspace-1 = [ "<Shift><Super>1" ];
      move-to-workspace-2 = [ "<Shift><Super>2" ];
      move-to-workspace-3 = [ "<Shift><Super>3" ];
      move-to-workspace-4 = [ "<Shift><Super>4" ];
      move-to-workspace-5 = [ "<Shift><Super>5" ];
      move-to-workspace-6 = [ "<Shift><Super>6" ];
      switch-input-source = [ "<Shift><Alt>" ];
      switch-input-source-backward = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
      close = [ "<Super>u" ];
    };
    "org/gnome/shell/keybindings" = {
      toggle-overview = ["<Super>a"];
      toggle-application-view = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
      switch-to-application-1 = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
      switch-to-application-2 = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
      switch-to-application-3 = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
      switch-to-application-4 = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
      switch-to-application-5 = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
      switch-to-application-6 = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
    };


    "org/gnome/shell".enabled-extensions = [
      "clipboard-history@alexsaveau.dev"
      "search-light@icedman.github.com"
      "space-bar@luchrioh"
      "trayIconsReloaded@selfmade.pl"
    ];
    "org/gnome/shell/extensions/search-light".shortcut-search = ["<Super>d"];
    "org/gnome/shell/extensions/space-bar/behavior".toggle-overview = false;
  };  

  # The home.stateVersion is a crucial setting that locks your Home Manager
  # configuration to a specific version, ensuring future compatibility.
  home.stateVersion = "25.05";
}
