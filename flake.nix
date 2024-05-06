{
  description = "My flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-gaming.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland = {
    url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
# nvim plugins
    obsidian-nvim = { url = "github:epwalsh/obsidian.nvim"; flake = false; };
    
# Star Citizen
    nix-citizen.url = "github:LovingMelody/nix-citizen";
    nix-citizen.inputs.nix-gaming.follows = "nix-gaming";

    };
  

  outputs = { self, nixpkgs, nixos-hardware, ... } @ inputs: {

    nixosConfigurations = import ./modules/core/default.nix {
      inherit self nixpkgs inputs nixos-hardware ;
    };
  };
}
