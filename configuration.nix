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
  
  networking.hostName = "NixOS"; # Define your hostname.
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
    LC_TIME = "en_IN";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Wacom tablet config

  # services.xserver.inputClassSections = [
  	# ''
  	# Indentifier "One by Wacom (small)"
 	# MatchUSBID "0x056a:0x037a"
 	# MatchDevicePath "/dev/input/event18"
 	# MatchIsTablet "on"
 	# Driver "wacom"
  	# ''
  # ];

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Bluetooth configuration
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.blueman.enable = true;

  # hardware.pulseaudio.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

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
    extraGroups = [ "networkmanager" "wheel" ];
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
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    pkgs.opentabletdriver
    pkgs.materia-kde-theme
    pkgs.catppuccin-kvantum
    pkgs.usbutils
  	pkgs.lsd
  	pkgs.kdePackages.qtstyleplugin-kvantum
    pkgs.zsh
    pkgs.obsidian
    pkgs.steam
    pkgs.micro
    pkgs.zsh-autosuggestions
    pkgs.zsh-syntax-highlighting
    pkgs.vscode
    pkgs.git
  ];
  
  qt.style = "kvantum";
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
  };

  # Steam Config
  programs.steam = {
  	enable = true;
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
  	wantedBy = [ "multi-user.target" ];
  };


  # AppleEmoji
  # fonts.packages = with pkgs; [
	# (fetchurl {
	# 	url = "https://github.com/samuelngs/apple-emoji-linux/releases/download/v17.4/AppleColorEmoji.ttf";
	# 	# sha256 = "ae005179c64e4413b38583ed66468f3f728f3e5c84344758cc3d9b2596335f8a";
	# 	sha256 = "SG3JQLybhY/fMX+XqmB/BKhQSBB0N1VRqa+H6laVUPE=";
	# })
	# nerdfonts.override { fonts = [ "JetBrainsMono" ];}
  # ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Tablet Config
  hardware.opentabletdriver.enable = true;
  hardware.opentabletdriver.daemon.enable = true;
}
