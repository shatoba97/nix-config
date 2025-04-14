{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = { 
     url = "github:nix-community/home-manager";
     inputs.nixpkgs.follows = "nixpkgs";
    };  
    nixgl.url = github:guibou/nixGL;
  };

  outputs = { nixpkgs, home-manager, nixgl, ... }: 
    let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."alex" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home.nix];
      };
    };
}
    

    
