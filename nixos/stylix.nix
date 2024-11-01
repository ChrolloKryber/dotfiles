{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    image = ./wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    fonts = {
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

    cursor = {
      package = pkgs.oreo-cursors-plus;
      name = "oreo_spark_light_sea_green_bordered_cursors";
      size = 32;
    };
  };
}
