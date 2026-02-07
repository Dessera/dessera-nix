{
  vscode-marketplace,
  vscode-extensions,
  ...
}:

(with vscode-marketplace; [
  rust-lang.rust-analyzer
  dustypomerleau.rust-syntax
  fill-labs.dependi
])
++ (with vscode-extensions; [
  vadimcn.vscode-lldb
])
