{ config, pkgs, ... }:

{
  home.username = "achyutbadyal";
  home.homeDirectory = "/Users/achyutbadyal";
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself
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

    # --- macOS GUI Apps & Tiling Window Manager ---
    aerospace
    insomnia
    kitty
    localsend
  ];
}
