{ ext, ... }:
(with ext.open-vsx; [
  charliermarsh.ruff
  njpwerner.autodocstring
  kevinrose.vsc-python-indent
  tamasfe.even-better-toml
  ms-python.debugpy
])
++ (with ext.vscode-marketplace; [
  ms-python.python
  ms-python.vscode-pylance
])
