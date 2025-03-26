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
    sneovide = "steam-run neovide";
    sendme = "~/.dotfiles/hmconfigs/shell/programs/sendme";
    fnall = "~/.dotfiles/hmconfigs/shell/programs/fnall";
  };

in
{

  programs.zsh = {
    enable = true;
    shellAliases = aliases;
    initExtra = ''
      #make nvim default editor
      export EDITOR=nvim

      # Enable programs
      eval "$(starship init zsh)"
      eval "$(fzf --zsh)" 

      # History Keybinds
      bindkey "''${key[Up]}" history-substring-search-up
      bindkey "''${key[Down]}" history-substring-search-down
    
    
    '';

    plugins = [
      { 
        name = "zsh-autosuggestions"; 
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          tag = "v0.7.1";
          sha256 = "vpTyYq9ZgfgdDsWzjxVAE7FZH4MALMNZIFyEOBLm5Qo=";
        };
      }
      { 
        name = "zsh-history-substring-search";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-history-substring-search";
          tag = "v1.1.0";
          sha256 = "GSEvgvgWi1rrsgikTzDXokHTROoyPRlU0FVpAoEmXG4=";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          tag = "0.8.0";
          sha256 = "iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
        };
      }
    ]; 

  };

  programs.bash = {
    enable = true;
    shellAliases = aliases;
  };

}
