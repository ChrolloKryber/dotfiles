# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel packages
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  networking = {
    hostName = "NixOS"; # Define your hostname.
    nameservers = [ "1.1.1.1" "1.0.0.1" "8.8.8.8" ];
    networkmanager.dns = "none";

    stevenblack = {
      enable = true;
      block = ["fakenews" "gambling"];
    };
  };


  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

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

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

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

  # hardware.pulseaudio.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable OpenGL and video drivers
  hardware.graphics.enable = true;

  # Docker Settings
  virtualisation.docker = {
    enable = true;
    rootless = {
    	enable = true;
    	setSocketVariable = true;
    };

  };

  services.xserver.videoDrivers = ["amdgpu"];
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.raghav = {
    isNormalUser = true;
    description = "Rishay Raghav";
    extraGroups = [ "networkmanager" "wheel" "adm" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    blueberry
    brightnessctl
    catppuccin-kvantum
    cliphist
    fastfetch
    git
    gnome-keyring
    hyprpicker
    killall
    kitty
    kdePackages.applet-window-buttons6
    kdePackages.kdeconnect-kde
    kdePackages.qtstyleplugin-kvantum
    libnotify
    lsd
    materia-kde-theme
    micro
    neovim
    networkmanagerapplet
    nwg-look
    obsidian
    pipes
    playerctl
    pwvucontrol
    python3
    qbittorrent
    qdirstat
    ripgrep
    rofi-wayland
    ryzenadj
    spotify
    steam
    starship
    swaynotificationcenter
    swww
    telegram-desktop
    usbutils
    vlc
    vscode
    waybar
    wallust
    wl-clipboard
    wlogout
    wmctrl
    xclip
    xdg-desktop-portal-hyprland
    yt-dlp
    zsh
    zsh-syntax-highlighting
    zsh-autosuggestions
  ];
  
  qt.style = "kvantum";

  ### Hyprland setup
  programs.hyprland = {
  	enable = true;
  	xwayland.enable = true;
  };

  programs.hyprlock.enable = true;
  # programs.nm-applet.indicator = true;

  environment.sessionVariables = {
  	NIXOS_OZONE_WL = "1";
  	# WLR_NO_HARDWARE_CURSORS = "1";
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
  networking.firewall = {
  	allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  	allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
  };

  networking.firewall = {
  	allowedTCPPorts = [22];
  };
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
  system.stateVersion = "24.05"; # Did you read the comment?


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
      l="ls -lhA";
      nano="micro";
      sudo="sudo ";     
    };
    interactiveShellInit = ''
      cat $HOME/.cache/wallust/sequences
      unalias -a
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
    (nerdfonts.override { fonts = [ "JetBrainsMono" "NerdFontsSymbolsOnly" ]; })
    noto-fonts
    noto-fonts-cjk-sans
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

  programs.kdeconnect.enable = true;

  # Firefox settings about:config
  programs.firefox = {
  	preferences = {
  		"browser.urlbar.shortcuts.bookmarks" = false;
  		"browser.urlbar.shortcuts.history" = false;
  		"browser.urlbar.shortcuts.tabs" = false;
  		"browser.urlbar.suggest.bookmark" = false;
  		"browser.urlbar.suggest.pocket" = false;
  		"extensions.pocket.api" = "0.0.0.0";
  		"extensions.pocket.bffApi" = "0.0.0.0";
  		"extensions.pocket.bffRecentSaves" = false;
  		"extensions.pocket.enabled" = false;
  		"extensions.pocket.showHome" = false;
  		"fission.autostart" = false;
  		"gfx.webrender.all" = false;
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
