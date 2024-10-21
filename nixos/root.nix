{ config, pkgs, ... }:

{
  imports = [ ./nvim.nix ];
  home.username = "root";
  home.homeDirectory = "/root";

  stylix = {
    enable = true;
    targets = {
      neovim.enable = true;
      neovim.transparentBackground.main = true;
      neovim.transparentBackground.signColumn = true;
    };
  };
  
  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
