pkgs:
(with pkgs.vscode-marketplace; [
  jeff-hykin.better-cpp-syntax
  llvm-vs-code-extensions.vscode-clangd
  ms-vscode.cmake-tools
  cheshirekow.cmake-format
  ms-vscode.makefile-tools
  cschlosser.doxdocgen
  tboox.xmake-vscode
  mesonbuild.mesonbuild
])
++ (with pkgs.vscode-extensions; [
  vadimcn.vscode-lldb
])
