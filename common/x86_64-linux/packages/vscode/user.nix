{ ... }:

let
  nixos-vscode-server = fetchTarball {
    url = "https://github.com/msteen/nixos-vscode-server/tarball/master";
    sha256 = "1rq8mrlmbzpcbv9ys0x88alw30ks70jlmvnfr2j8v830yy5wvw7h";
  };
in
{
  imports = [
    "${nixos-vscode-server}/modules/vscode-server/home.nix"
  ];

  programs.vscode.enable = true;

  services.vscode-server = {
    enable = true;
    enableFHS = true;
  };
}
