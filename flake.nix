{
    description = "Paro's flake";
    
    outputs = { self, nixpkgs, home-manager, ... } @ inputs:
        let
            # --- SYSTEM SETTINGS --- #
            systemSettings = {
                system = "x86_64-linux";
                hostname = "nixos"; # hostname
                profile = "personal"; # select a profile defined from my profiles directory
                timezone = "Europe/Rome"; # select timezone
                locale = "en_US.UTF-8"; # select locale
                layout = "us";
            };

            # --- USER SETTINGS --- #
            userSettings = {
                username = "paro";
                email = "cooparo@proton.me";
                dotfilesDir = "~/dotfiles";
                fonts = [ "FiraCode" ];
                fontSize = 12;
                term = "alacritty";
                editor = "neovim";
                browser = "brave";
                theme = "nord"; 
            };

            # Config lib
            lib = nixpkgs.lib;

            # Nixpkgs
	        pkgs = nixpkgs.legacyPackages.${systemSettings.system};

        in {
            nixosConfigurations.${systemSettings.hostname} = lib.nixosSystem {
                system = systemSettings.system;
                modules = [ ./profiles/${systemSettings.profile}/configuration.nix ];

                specialArgs = {
                    inherit userSettings;
                    inherit systemSettings;
                    inherit inputs;
                };
            }; # END nixosConfigurations

    	    homeConfigurations.${userSettings.username} = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [ ./profiles/${systemSettings.profile}/home.nix ];

                extraSpecialArgs = {
                    inherit userSettings;
                    inherit systemSettings;
                    inherit inputs;
                };
            }; # END homeConfigurations
        };

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-23.11";
	    home-manager.url = "github:nix-community/home-manager/release-23.11";
	    home-manager.inputs.nixpkgs.follows = "nixpkgs";

        # Theme
        stylix.url = "github:danth/stylix";
    };
}
