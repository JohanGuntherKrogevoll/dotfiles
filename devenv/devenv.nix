{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = with pkgs; [
          bash-completion
          bashInteractive
          bat
          broot
          btop
          bun
          cargo
          curl
          direnv
          docker
          docker-buildx
          du-dust
          entr
          fzf
          gettext
          gh
          git
          glow
          gnugrep
          gnupg
          gnused
          google-cloud-sdk
          jq
          jqp
          just
          lazydocker
          lazygit
          less
          lolcat
          lsd
          lsof
          nodePackages.nodemon
          nodePackages.pnpm
          nodePackages.ts-node
          nodePackages.firebase-tools
          nodejs_20
          openssh
          procs
          ripgrep
          rlwrap
          rm-improved
          rustup
          sd
          shellcheck
          starship
          # terraform
          # terraform-docs
          tfsec
          unzip
          uutils-coreutils-noprefix
          wget
          xclip
          xcp
          xsel
          yq
          zellij
          zip
          zsh
];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hrello from $GREET";

  enterShell = ''
    hello
    git --version
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep "2.42.0"
  '';

  dotenv.enable = true;
  # https://devenv.sh/languages/
  languages.nix.enable = true;
  languages.javascript.enable = true;
  languages.typescript.enable = true;
  # languages.terraform.enable = true;

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
