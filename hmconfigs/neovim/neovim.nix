{ config, pkgs, ... }:

{

  programs.neovim.enable = true;
  home.file."./config/nvim/init.lua".source = ./nconfig/init.lua;
}
