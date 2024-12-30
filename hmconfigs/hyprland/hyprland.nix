{ config, pkgs, ... }:


{
  wayland.windowManager.hyprland.enable = true;
  home.file.".config/hypr/".source = ./hypr;
}
