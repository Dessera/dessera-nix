{ writeShellScriptBin }:
writeShellScriptBin "build-os" ''
  # somehow the .gtkrc-2.0.backup file leads to home-manager not being able to refresh
  rm -f ~/.gtkrc-2.0.backup

  sudo nixos-rebuild $@
''
