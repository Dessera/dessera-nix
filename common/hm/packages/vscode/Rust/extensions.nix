pkgs:
(with pkgs.vscode-marketplace; [
  rust-lang.rust-analyzer
  dustypomerleau.rust-syntax
  fill-labs.dependi
  tamasfe.even-better-toml
])
++ (with pkgs.vscode-extensions; [
  vadimcn.vscode-lldb
])
