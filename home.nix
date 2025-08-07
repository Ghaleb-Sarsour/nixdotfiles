{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hmconfigs/shell/sh.nix
    ./hmconfigs/neovim/neovim.nix
    ./hmconfigs/hyprland/hyprland.nix
    ./hmconfigs/wezterm/wezterm.nix
    ./hmconfigs/starship/starship.nix
    ./hmconfigs/yazi/yazi.nix
    ./hmconfigs/hyprpanel/hyprpanel.nix
    ./hmconfigs/tofi/tofi.nix
    ./hmconfigs/librewolf/librewolf.nix
    ./hmconfigs/icons/icons.nix
    ./hmconfigs/themes/themes.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ext4";
  home.homeDirectory = "/home/ext4";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
    };
  };
}
