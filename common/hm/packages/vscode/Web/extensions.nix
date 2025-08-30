pkgs:
(with pkgs.vscode-marketplace; [
  vue.volar
  esbenp.prettier-vscode
  biomejs.biome
  denoland.vscode-deno
  bradlc.vscode-tailwindcss
])
++ (with pkgs.vscode-extensions; [
  dbaeumer.vscode-eslint
])
