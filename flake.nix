{
  description = "Paro's flake";

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      stylix,
      ...
    }@inputs:
    let
      # --- SYSTEM SETTINGS --- #
      systemSettings = {
        system = "x86_64-linux";
        host = "anon"; # hostname
        timezone = "Europe/Rome"; # select timezone
        locale = "en_US.UTF-8"; # select locale
        resolution = "1920x1200";
      };

      # --- USER SETTINGS --- #
      userSettings = {
        username = "paro";
        email = "github.ambitious226@slmails.com";
        dotfilesDir = "/home/paro/dotfiles";

        term = "alacritty";
        editor = "nvim";
        browser = "brave";
        shell = "zsh";

        eth-interface = "";
        wifi-interface = "wlp0s20f3";

        nerdfonts = [
          "FiraCode"
          "Iosevka"
        ];

        kbLayout = "it";
        fontSize = 12;
        theme = "everforest";
      };

      # Config lib
      inherit (nixpkgs) lib;

      # Nixpkgs
      pkgs = nixpkgs.legacyPackages.${systemSettings.system};
      pkgs-stable = nixpkgs-stable.legacyPackages.${systemSettings.system};

    in
    {
      nixosConfigurations.${systemSettings.host} = lib.nixosSystem {
        inherit (systemSettings) system;
        modules = [
          ./host/${systemSettings.host}/configuration.nix

          stylix.nixosModules.stylix
        ];

        specialArgs = {
          inherit userSettings;
          inherit systemSettings;
          inherit pkgs-stable;
          inherit inputs;
          inherit (inputs) nixos-hardware;
        };
      }; # END nixosConfigurations
      homeConfigurations.${userSettings.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./host/${systemSettings.host}/home.nix

          stylix.homeManagerModules.stylix
        ];

        extraSpecialArgs = {
          inherit userSettings;
          inherit systemSettings;
          inherit pkgs-stable;
          inherit (inputs) nix-colors nixvim;
        };
      }; # END homeConfigurations
    };

  inputs = {
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-colors.url = "github:misterio77/nix-colors";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    stylix.url = "github:danth/stylix";
  };
}
