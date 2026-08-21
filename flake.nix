{
# Description (optional)
  description = "FLAKE CONFIG WITH HOME MANAGER";

# Intputs
  inputs = {
  # Adding unstable rebuild
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  # Add Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  # Helium Browser
    helium = {
      url = "github:amaanq/helium-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

# Outputs
  outputs = { self, nixpkgs, home-manager, helium, ... }@inputs:
    let
      username = "user"; # Change this!!!
      hostname = "host"; # This too...
    in
    {
    nixosConfigurations = {
      ${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs hostname username helium; };
        system = "x86_64-linux";
        modules = [
        # Main configuration module
          ./configuration.nix
        # Home Manager module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { inherit inputs username hostname; };

          # Imports Home Manager configs
            home-manager.users.${username} = {
              imports = [
                ./home.nix
              ];
            };
          }
        ];
      };
    };
  };
}
