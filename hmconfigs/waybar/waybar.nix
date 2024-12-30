{ config, pkgs, ... }:

{
    programs.waybar.enable = true;
    home.file.".config/waybar/config".source = ./config;
}
