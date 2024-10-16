# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./firefox.nix
      inputs.home-manager.nixosModules.default
      ./stylix.nix
    ];
  

  nix.settings.experimental-features = ["nix-command" "flakes"];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel packages
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  networking = {
    networkmanager.enable = true;
    networkmanager.dns = "none";
    hostName = "NixOS"; # Define your hostname.
    nameservers = [ "1.1.1.1" "1.0.0.1" "8.8.8.8" ];

    stevenblack = {
      enable = true;
      block = ["fakenews" "gambling"];
    };
    
    firewall = {
      allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
      allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
      allowedTCPPorts = [22];
    };
  };


  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_GB.UTF-8";
  };
  
  services.xserver = {
    enable = true; 
    xkb = {
      layout = "us";
    };
    videoDrivers = ["amdgpu"];
  };

  services.displayManager.sddm= {
      enable = true;
      wayland.enable = true;
      theme = "chili";
  };

  # Bluetooth configuration
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };

  services.blueman.enable = true;
  services.printing.enable = false;

  hardware.graphics.enable = true;

  # Virtualisation Settings
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
    	enable = true;
    	setSocketVariable = true;
      };
    };

    virtualbox.host.enable = true;
    virtualbox.guest.enable = true;
    virtualbox.guest.dragAndDrop = true;

  };


  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.

  programs.adb.enable = true;
  users.users.archer = {
    isNormalUser = true;
    description = "Archer";
    extraGroups = [ "adbusers" "networkmanager" "wheel" "adm" "docker" "vboxusers" ];
    shell = pkgs.zsh;
  };
  
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    
    users = {
      "archer" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    brightnessctl
    busybox
    cliphist
    evince
    fastfetch
    git
    gnome-keyring
    grimblast
    kdePackages.kdeconnect-kde
    libnotify
    loupe
    lsd
    nautilus
    networkmanagerapplet
    obsidian
    pipes
    playerctl
    pwvucontrol
    python3
    qalculate-gtk
    qbittorrent
    ripgrep
    rofi-wayland
    ryzenadj
    sddm-chili-theme
    spotube
    starship
    swaynotificationcenter
    swww
    telegram-desktop
    themechanger
    ungoogled-chromium
    usbutils
    vlc
    vscode
    waybar
    wl-clipboard
    wlogout
    xdg-desktop-portal-hyprland
    yt-dlp
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
  
  ### Hyprland setup
  programs.hyprland = {
  	enable = true;
  	xwayland.enable = true;
  };

  programs.hyprlock.enable = true;
  # programs.nm-applet.indicator = true;

  environment.sessionVariables = {
  	NIXOS_OZONE_WL = "1";
  	WLR_NO_HARDWARE_CURSORS = "1";
  };

  xdg.portal = {
  	enable = true;
  	extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?


  # ZSH Config  
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
      	"git"
      ];
    };
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
    shellAliases = {
      ls="lsd";
      ll="ls -lh";
      la="ls -lha";
      lA="ls -lhA";
      nano="nvim";
      sudo="sudo ";     
    };
    interactiveShellInit = ''
      unalias -a
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
      source ${pkgs.zsh-you-should-use}/share/zsh/plugins/you-should-use/you-should-use.plugin.zsh
      eval "$(${pkgs.starship}/bin/starship init zsh)"
    '';
  };

  # Steam Config
  programs.steam = {
  	enable = true;
  	gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  # Systemd battery threshold service
  systemd.services.battery-charge-threshold = {
    enable = true;
  	description = "Set the battery maximum charge threshold";
  	unitConfig = {
  		Type = "oneshot";
  	};
  	serviceConfig = {
  		ExecStart = "/run/current-system/sw/bin/zsh -c 'echo 85 > /sys/class/power_supply/BAT0/charge_control_end_threshold'";
  		Restart = "on-failure";
  	};
  	wantedBy = [ "multi-user.target"  "local-fs.target" "suspend.target"];
  	after = [ "local-fs.target" "suspend.target" ];
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "NerdFontsSymbolsOnly" ]; })
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    unifont
  ];
  # Tablet Config
  hardware.opentabletdriver = {
  	enable = true;
  	blacklistedKernelModules = [ "wacom" "hid_uclogic"];
  };
  
  # Starship
  programs.starship = {
  	enable = true;
  	settings = {
  	  character = {
  	    success_symbol =  "[λ](bold green)";
	    error_symbol = "[λ](bold red)";
	  };
  	};
  };

  # Sudo Config
  security.sudo = {
  	extraConfig = ''
	  Defaults pwfeedback
	  Defaults insults
  	'';
  };
}
