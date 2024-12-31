{ config, pkgs, ... }:

{
    home.file.".emacs.d/".source = ./doom-emacs; 
}
