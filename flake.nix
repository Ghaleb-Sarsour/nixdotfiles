{

  description = "Main System Flake";
  
  inputs = {
    #Grabbing Packages/Sources
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    winapps = {
      url = "github:winapps-org/winapps";        
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    
    #Programs
    ghostty.url = "github:ghostty-org/ghostty"; 
  };

  outputs = {self, nixpkgs, nixpkgs-stable, home-manager, nixos-hardware, ghostty, winapps, ...}: 
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    in
    {

      #Create System Configurations
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
 	    modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-e14-intel
          {
            environment.systemPackages = [
              ghostty.packages.x86_64-linux.default
              winapps.packages.${system}.winapps
              winapps.packages.${system}.winapps-launcher
            ];
          }
        ];

        specialArgs = {
          inherit pkgs-stable;
        };

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
