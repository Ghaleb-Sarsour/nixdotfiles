{

  description = "Main System Flake";
  
  inputs = {
    #Grabbing Packages/Sources
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    #Ensure home-manager and nixpkgs are the same version
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, ...}: 
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
 	  modules = [./configuration.nix];
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
