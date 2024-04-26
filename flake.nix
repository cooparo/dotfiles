{
    description = "Paro's flake";
    
    outputs = { self, nixpkgs, home-manager, ... } @ inputs:
        let
            # --- SYSTEM SETTINGS --- #
            systemSettings = {
                system = "x86_64-linux";
                hostname = "nixos"; # hostname
                profile = "desktop"; # select a profile defined from my profiles directory
                timezone = "Europe/Rome"; # select timezone
                locale = "en_US.UTF-8"; # select locale
                resolution = "1920x1080";
            };

            # --- USER SETTINGS --- #
            userSettings = {
                username = "paro";
                email = "cooparo@proton.me";
                dotfilesDir = "/home/paro/dotfiles";
                
                term = "alacritty";
                editor = "nvim";
                browser = "brave";
                shell = "zsh";

                eth-interface = "eno1";
                wifi-interface = "";

                nerdfonts = [ "FiraCode" "Iosevka" ];
                fontSize = 12;
                theme = "nord"; 
                # theme = "gruvbox-dark-medium"; 
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
                    inherit (inputs) nix-colors;
                    inherit (inputs) nixvim;
                };
            }; # END homeConfigurations
        };

    inputs = {
        nixpkgs-stable.url = "nixpkgs/nixos-23.11";
        nixpkgs.url = "nixpkgs/nixos-unstable";

	    home-manager.url = "github:nix-community/home-manager/master";
	    home-manager.inputs.nixpkgs.follows = "nixpkgs";

        nix-colors.url = "github:misterio77/nix-colors";

        nixvim.url = "github:nix-community/nixvim";
        nixvim.inputs.nixpkgs.follows = "nixpkgs";
    };
}
