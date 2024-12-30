{ config, pkgs, ... }:

{

  programs.neovim.enable = true;
  home.file."./config/nvim/init.lua".path = ''./nconfig/init.lua''
}
