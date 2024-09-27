{
  programs.firefox = {
    enable = true;
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

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;

      ExtensionSettings = {
        "*" = {
	  installation_mode = "force_installed";
	  allowed_types = ["extension" "theme"];
	};
        "uBlock0@raymondhill.net" = {
	  install_url="https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
	  installation_mode = "force_installed";
	};
        "addon@darkreader.org" = { 
	  install_url="https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
 	  installation_mode = "force_installed";
	};
	"78272b6fa58f4a1abaac99321d503a20@proton.me" = {
	  install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
 	  installation_mode = "force_installed";
	};

        "jid1-MnnxcxisBPnSXQ@jetpack" = {
	  install_url="https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
	  installation_mode = "force_installed";
	};

       "sponsorBlocker@ajay.app" = {
         install_url="https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
 	  installation_mode = "force_installed";
	};

       "jid1-BoFifL9Vbdl2zQ@jetpack"= {
          install_url="https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/latest.xpi";
 	  installation_mode = "force_installed";
	};

       "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
         install_url="https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
	 installation_mode = "force_installed";
	};

       "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = { 
         install_url="https://addons.mozilla.org/firefox/downloads/latest/styl-us/latest.xpi";
 	  installation_mode = "force_installed";
	};

       "{74145f27-f039-47ce-a470-a662b129930a}" = {
         install_url="https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
   	 installation_mode = "force_installed";
	};
"{22b0eca1-8c02-4c0d-a5d7-6604ddd9836e}" = { 
install_url="https://addons.mozilla.org/firefox/downloads/latest/nicothin-space/latest.xpi";
 	  installation_mode = "force_installed";
	};

    };
	};
    
  };
}
