{
  vscode-marketplace,
  vscode-extensions,
  ...
}:

(with vscode-marketplace; [
  jeff-hykin.better-c-syntax
  jeff-hykin.better-cpp-syntax
  basdp.language-gas-x86
  vscode-marketplace."13xforever".language-x86-64-assembly
  llvm-vs-code-extensions.vscode-clangd
  ms-vscode.cmake-tools
  cheshirekow.cmake-format
  ms-vscode.makefile-tools
  cschlosser.doxdocgen
  tboox.xmake-vscode
  mesonbuild.mesonbuild
])
++ (with vscode-extensions; [
  vadimcn.vscode-lldb
])
