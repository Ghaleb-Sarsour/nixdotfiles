{

  description = "Main System Flake";
  
  inputs = {
    #Grabbing Packages/Sources
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    #Ensure home-manager and nixpkgs are the same version
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, nixos-hardware, ...}: 
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      #Create System Configurations
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
 	    modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-e14-intel
        ];
        };
      };

      #Home Manager Configurations
      homeConfigurations = {
        ext4 = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;
 	  modules = [./home.nix];
      };
    };

  };



}
