{
  vscode-marketplace,
  vscode-extensions,
  ...
}:

(with vscode-marketplace; [
  vue.volar
  esbenp.prettier-vscode
  biomejs.biome
  denoland.vscode-deno
  bradlc.vscode-tailwindcss
])
++ (with vscode-extensions; [
  dbaeumer.vscode-eslint
])
