{config, pkgs, ...}:

let
  aliases = {
    ll = "ls -l";
    ".." = "cd ..";
    "hmapply" = "home-manager switch --flake .";
    "flapply" = "sudo nixos-rebuild switch --flake .";
    "flupdate" = "nh os switch --update ~/.dotfiles/";
    zjs = "steam-run ~/zulu11.76.21-ca-fx-jdk11.0.25-linux_x64/bin/java";
    zjcs = "steam-run ~/zulu11.76.21-ca-fx-jdk11.0.25-linux_x64/bin/javac";
    snvim = "steam-run nvim";
    sendme = "~/.dotfiles/hmconfigs/shell/programs/sendme";
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
