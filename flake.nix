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

  # KDE Plasma manager (for Konsole)
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  # Helium Browser (Unless)
#    helium = {
#      url = "github:schembriaiden/helium-browser-nix-flake";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };
  };

# Outputs
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      username = "krev"; # Change this!!!
      hostname = "pechka"; # This too...
    in
    {
    nixosConfigurations = {
      ${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs hostname username; };
        system = "x86_64-linux";
        modules = [
        # Main configuration module
          ./configuration.nix
        # Home Manager module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs username hostname; };

          # Imports Home Manager configs
            home-manager.users.${username} = {
              imports = [
                inputs.plasma-manager.homeManagerModules.plasma-manager
                ./home.nix
              ];
            };
          }
        ];
      };
    };
  };
}
