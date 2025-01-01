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
    initExtra = "export PATH=$PATH:$HOME/.emacs.d/bin";
  };

   programs.bash = {
    enable = true;
    shellAliases = aliases;
  };

}
