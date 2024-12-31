{ config, pkgs, ... }:

{
  home.file.".emacs.d/".source = ./doom-emacs; 
  home.file.".doom.d".source = ./doom.d;
}
