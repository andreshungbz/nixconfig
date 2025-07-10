# KDE Plasma 6 Packages

{ pkgs }:
with pkgs;
[
  # KDE
  kdePackages.filelight # disk usage
  kdePackages.kleopatra
  kdePackages.koi # auto light/dark theming
  kdePackages.isoimagewriter
  kdePackages.partitionmanager
  kdePackages.sddm-kcm
]
