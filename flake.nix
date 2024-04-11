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
                # layout = "it";
                resolution = "1920x1200";
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
                # theme = "gruvbox"; 
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
                };
            }; # END nixosConfigurations

    	    homeConfigurations.${userSettings.username} = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [ ./profiles/${systemSettings.profile}/home.nix ];

                extraSpecialArgs = {
                    inherit userSettings;
                    inherit systemSettings;
                };
            }; # END homeConfigurations
        };

    inputs = {
        nixpkgs-stable.url = "nixpkgs/nixos-23.11";
        nixpkgs.url = "nixpkgs/nixos-unstable";

	    home-manager.url = "github:nix-community/home-manager/master";
	    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };
}
