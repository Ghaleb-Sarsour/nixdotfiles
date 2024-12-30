{config, pkgs, ...}:

let
  aliases = {
    ll = "ls -l";
    ".." = "cd ..";
    "hmapply" = "home-manager switch --flake .";
    "flapply" = "sudo nixos-rebuild switch --flake .";
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
