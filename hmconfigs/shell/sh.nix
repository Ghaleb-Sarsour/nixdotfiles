{config, pkgs, ...}:

let
  aliases = {
    ll = "ls -l";
    ".." = "cd ..";
    "hmapply" = "home-manager switch --flake .";
    "flapply" = "sudo nixos-rebuild switch --flake .";
    zjs = "steam-run ~/.dotfiles/hmconfigs/shell/zulu11.76.21-ca-fx-jdk11.0.25-linux_x64/bin/java";
    zjcs = "steam-run ~/.dotfiles/hmconfigs/shell/zulu11.76.21-ca-fx-jdk11.0.25-linux_x64/bin/javac";
    zj = "~/.dotfiles/hmconfigs/shell/zulu11.76.21-ca-fx-jdk11.0.25-linux_x64/bin/java";
    zjc = "~/.dotfiles/hmconfigs/shell/zulu11.76.21-ca-fx-jdk11.0.25-linux_x64/bin/javac";
  };

in
{

  programs.zsh = {
    enable = true;
    shellAliases = aliases;
    #initExtra = "export PATH=$PATH:$HOME/.dotfiles/hmconfigs/shell/zulu11.76.21-ca-fx-jdk11.0.25-linux_x64/bin/";
  };

   programs.bash = {
    enable = true;
    shellAliases = aliases;
  };

}
