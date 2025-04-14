{
  description = "Main System Flake";
  
  inputs = {
    #Grabbing Packages/Sources
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.11";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {self, nixpkgs, nixpkgs-stable, home-manager, nixos-hardware, hyprpanel, ...} @ inputs: 
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
            ./configuration.nix
            nixos-hardware.nixosModules.lenovo-thinkpad-e14-intel
            {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
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
