{ config, pkgs, ... }:

{
  home.file.".config/nvim/".source = ./nconfig;
}
