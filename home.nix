{ config, pkgs, ... }:

{
  home.username = "achyutbadyal";
  home.homeDirectory = "/Users/achyutbadyal";
  home.stateVersion = "24.05";
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # --- Development & Cloud CLI ---
    argo-workflows
    azure-cli
    kubelogin
    d2
    gnupg
    lazygit
    mise
    p7zip

    # --- Shell & Terminal Ecosystem ---
    fzf
    gh
    neovim
    tmux
    mole-cleaner
    claude-code

    # --- macOS GUI Apps & Tiling Window Manager ---
    aerospace
    insomnia
    ghostty-bin
    localsend
    pdfcraft
    tinycast
  ];
}
