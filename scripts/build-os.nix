{ writeShellScriptBin }:
writeShellScriptBin "build-os" ''
  rm -f ~/.config/gtk-2.0/.gtkrc.bkp

  sudo nixos-rebuild $@
''
