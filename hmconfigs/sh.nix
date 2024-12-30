{config, pkgs, ...}:

let
  aliases = {
    ll = "ls -l";
    ".." = "cd ..";
  };

in
{
 
  programs.zsh = {
    enable = true;
    shellAliases = aliases;
  };

   programs.bash = {
    enable = true;
    shellAliases = aliases;
  };

}
