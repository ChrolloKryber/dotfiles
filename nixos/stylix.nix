{ config, pkgs, inputs, lib, ...}:

{
  stylix.enable = true;
  stylix.polarity = "dark";
  stylix.image = ./wallpaper.png;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  
  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font";
    };
    serif = config.stylix.fonts.monospace;
    sansSerif = config.stylix.fonts.monospace;
    
    sizes = {
      applications = 12;
      terminal = 15;
      desktop = 10;
      popups = 10;
    };
  };

  stylix.cursor.package = pkgs.oreo-cursors-plus;
  stylix.cursor.name = "oreo_purple_cursors";

  stylix.targets.plymouth = {
    enable = true;
    logo = pkgs.catppuccin-plymouth;
  };

  stylix.targets.lightdm.enable = true;
  stylix.targets.gtk.enable = true;
}
