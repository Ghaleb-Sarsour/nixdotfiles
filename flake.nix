{
  description = "Main System Flake";
  
  inputs = {
    #Grabbing Packages/Sources
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
    oisd = {
      url = "https://big.oisd.nl/domainswild";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, nixos-hardware, rust-overlay, nix-flatpak, lanzaboote, ...} @ inputs: 
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-stable = import nixpkgs-stable { inherit system; config.allowUnfree = true;};
    in
    {
      #Create System Configurations
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit pkgs-stable;
            inherit inputs;
          };
          modules = [
            lanzaboote.nixosModules.lanzaboote
            nix-flatpak.nixosModules.nix-flatpak
            nixos-hardware.nixosModules.lenovo-thinkpad-e14-intel
            ./configuration.nix
            ({ pkgs, lib, ...}: {

              nixpkgs.overlays = [
                inputs.rust-overlay.overlays.default
              ];
              environment.systemPackages = [
                (pkgs.rust-bin.nightly.latest.default.override {
                  extensions = [ "rustc-codegen-cranelift-preview" ];
                })
              ];

              boot.loader.systemd-boot.enable = lib.mkForce false;

              boot.lanzaboote = {
                enable = true;
                pkiBundle = "/var/lib/sbctl/";
              };

            })
          ];
        };
      };

      #Home Manager Configurations
      homeConfigurations = {
          ext4 = home-manager.lib.homeManagerConfiguration {
	      inherit pkgs;
 	      modules = [
            ./home.nix
          ];
          extraSpecialArgs = {
            inherit nixpkgs-stable;  
          };
        };
      };
    
  };

}
