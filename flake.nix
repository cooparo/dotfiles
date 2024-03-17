{
    description = "My first flake";
    
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-23.11";
	    home-manager.url = "github:nix-community/home-manager/release-23.11";
	    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, ... }:
        let

            # --- SYSTEM SETTINGS --- #
	        system = "x86_64-linux";
	        pkgs = nixpkgs.legacyPackages.${system};

            # --- USER SETTINGS --- #
            userSettings = {
                username = "paro";
                email = "cooparo@proton.me";
                dotfilesDir = "~/dotfiles";
            };

            # Config lib
            lib = nixpkgs.lib;

        in {
            nixosConfigurations = {
                nixos = lib.nixosSystem {
		            inherit system;
                    modules = [ ./configuration.nix ];
            };
        };

	    homeConfigurations = {
                paro = home-manager.lib.homeManagerConfiguration {
		            inherit pkgs;
                    modules = [ ./home.nix ];
                };
            };
        };
}
