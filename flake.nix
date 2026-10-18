{
  description = "My macOS Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: 
    let
      system = "aarch64-darwin"; 
      pkgs = import nixpkgs {
        inherit system;
        # Expose custom packages directly under pkgs.*
        overlays = [ (import ./pkgs) ];
        config.allowUnfree = true;
      };
    in {
      homeConfigurations."achyutbadyal" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
        ];
      };
    };
}
