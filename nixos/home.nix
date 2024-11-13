{
  config,
  inputs,
  pkgs,
  ...
}: {
  # imports = [ ./nvim.nix ];
  home.username = "archer";
  home.homeDirectory = "/home/archer";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    delve
    kdePackages.qtstyleplugin-kvantum
    kitty
    koodo-reader
    materia-kde-theme
    proton-pass
    libsForQt5.qt5ct
    qt6ct
    rofi-wayland
    spotify
    swappy
    terraform
    tflint
    vesktop
  ];

  nixpkgs.config.allowUnfree = true;

  stylix = {
    enable = true;
    targets = {
      firefox.enable = true;
      gtk.enable = true;
      hyprland.enable = true;
      kitty.enable = true;
      kitty.variant256Colors = true;
      rofi.enable = true;
      waybar.enable = true;
      waybar.enableLeftBackColors = true;
      waybar.enableRightBackColors = true;
    };
  };

  qt.enable = true;
  qt.platformTheme.name = "qt5ct";
  qt.style.name = "adwaita-dark";
  qt.style.package = pkgs.adwaita-qt;

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.paper-icon-theme;
      name = "Paper";
    };
  };

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "image/jpeg" = ["org.gnome.Loupe.desktop"];
      "image/png" = ["org.gnome.Loupe.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
      "x-scheme-handler/chrome" = ["firefox.desktop"];
      "text/html" = ["firefox.desktop"];
      "application/x-extension-htm" = ["firefox.desktop"];
      "application/x-extension-html" = ["firefox.desktop"];
      "application/x-extension-shtml" = ["firefox.desktop"];
      "application/xhtml+xml" = ["firefox.desktop"];
      "application/x-extension-xhtml" = ["firefox.desktop"];
      "application/x-extension-xht" = ["firefox.desktop"];
      "text/markdown" = ["code.desktop"];
      "inode/directory" = ["/org.gnome.Nautilus.desktop"];
    };

    defaultApplications = {
      "image/jpeg" = ["org.gnome.Loupe.desktop"];
      "image/png" = ["org.gnome.Loupe.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
      "x-scheme-handler/chrome" = ["firefox.desktop"];
      "text/html" = ["firefox.desktop"];
      "application/x-extension-htm" = ["firefox.desktop"];
      "application/x-extension-html" = ["firefox.desktop"];
      "application/x-extension-shtml" = ["firefox.desktop"];
      "application/xhtml+xml" = ["firefox.desktop"];
      "application/x-extension-xhtml" = ["firefox.desktop"];
      "application/x-extension-xht" = ["firefox.desktop"];
      "text/markdown" = ["code.desktop"];
      "inode/directory" = ["/org.gnome.Nautilus.desktop"];
    };
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
