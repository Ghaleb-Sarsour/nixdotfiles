{ config, pkgs, ...}:

{
  home.file.".config/winapps".source = ./winappconf; 

}
