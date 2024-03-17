{
    description = "Paro's flake";
    
    outputs = { self, nixpkgs, home-manager, ... }:
        let

            # --- SYSTEM SETTINGS --- #
            systemSettings = {
                system = "x86_64-linux";
                hostname = "nixos"; # hostname
                profile = "personal"; # select a profile defined from my profiles directory
                timezone = "Europe/Rome"; # select timezone
                locale = "en_US.UTF-8"; # select locale
            };

            # --- USER SETTINGS --- #
            userSettings = {
                username = "paro";
                email = "cooparo@proton.me";
                dotfilesDir = "~/dotfiles";
                font = "FiraCode";
                # theme = e.g. gruvbox 
            };

            # Config lib
            lib = nixpkgs.lib;

            # Nixpkgs
	        pkgs = nixpkgs.legacyPackages.${systemSettings.system};


        in {
            nixosConfigurations = {
                nixos = lib.nixosSystem {
		            system = systemSettings.system;
                    modules = [ 
                        #(./. + "/profiles" + ("/" + systemSettings.profile)
                        # + "/configuration.nix")

                        # Works only with --impure
                        #/home/paro/dotfiles/profiles/personal/configuration.nix
                        ./configuration.nix
                    ];
                };

                specialArgs = {
                        inherit userSettings;
                        inherit systemSettings;
                    };
            }; # END nixosConfigurations

    	    homeConfigurations = {
                paro = home-manager.lib.homeManagerConfiguration {
		            inherit pkgs;
                    modules = [ 
                        #(./. + "/profiles" + ("/" + systemSettings.profile)
                        # + "/home.nix")
                        
                        # Works only with --impure
                        #/home/paro/dotfiles/profiles/personal/home.nix
                        ./home.nix
                    ];

                    extraSpecialArgs = {
                        inherit userSettings;
                        inherit systemSettings;
                    };
                };
            }; # END homeConfigurations
        };

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-23.11";
	    home-manager.url = "github:nix-community/home-manager/release-23.11";
	    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };
}
