{
  description = "Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };   
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core, homebrew-cask }:
  let
    configuration = { pkgs, ... }: {

      nixpkgs.config.allowUnfree = true;
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
       with pkgs; [ 
          neovim
          bat
          broot
          btop
          bun
          carapace
          curl
          devenv
          obsidian
          direnv
          docker
          docker-buildx
          du-dust
          entr
          fd
          fzf
          gettext
          gh
          git
          glow
          gnugrep
          gnupg
          gnused
          google-cloud-sdk
          iina
          jq
          jqp
          just
          lazydocker
          lazygit
          less
          lsd
          lsof
          nodePackages.nodemon
          nodePackages.pnpm
          nodePackages.ts-node
          nodePackages.firebase-tools
          nodejs_20
          nushell
          openssh
          procs
          ripgrep
          rlwrap
          rm-improved
          rustup
          sd
          shellcheck
          slack
          starship
          stow
          terraform
          terraform-docs
          tfsec
          unzip
          uutils-coreutils-noprefix
          wget
          xclip
          xcp
          xsel
          yq
          yarn
          yazi
          zellij
          zip
          zsh
        ];

      homebrew = {
          enable = true; 
          casks = [
            # Keeping stuff commented as its conflictiong with already installed apps. Uncomment on fresh install.
            # "arc"
            # "notion"
            "bitwarden"
            # "signal"
            # "docker"
            "firefox"
            # "visual-studio-code"
            # "discord"
            # shottr
            "spotify"
            # "insomnia"
            # "postman"
            # "homerow"
            "karabiner-elements"
            "bruno"
            # "kap"
            # "discord"
            # "raycast"
            # "kitty"
            # "steam"
            # "rectangle"
            # "mac-mouse-fix"
            "microsoft-teams"
          ];
          onActivation.cleanup = "zap";
        };

      system.defaults = {
        dock.autohide = true;
        dock.persistent-apps = [
        ];
        finder.FXPreferredViewStyle = "clmv";
        loginwindow.GuestEnabled  = false;
        NSGlobalDomain.AppleICUForce24HourTime = true;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.KeyRepeat = 2;
        NSGlobalDomain.InitialKeyRepeat = 15;
      };


      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration 
        nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "johanguntherkrogevoll";
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
              };
            };
          }
    ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."mac".pkgs;
  };
}
