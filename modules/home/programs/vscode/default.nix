{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.programs.vscode;

  extensionPkgs = { inherit (pkgs) vscode-marketplace open-vsx vscode-extensions; };

  loadUserSettings = p: builtins.fromJSON (builtins.readFile p);
  loadExtensions = p: (import p extensionPkgs);

  commonExtensions = with pkgs.vscode-marketplace; [
    # Appearance
    igorsbitnev.error-gutters
    aaron-bond.better-comments
    usernamehw.errorlens
    oderwat.indent-rainbow
    miguelsolorio.fluent-icons
    beardedbear.beardedtheme
    pkief.material-icon-theme

    # Syntax Highlighter
    jeff-hykin.better-nix-syntax
    jeff-hykin.better-dockerfile-syntax
    jeff-hykin.better-csv-syntax
    jeff-hykin.better-shellscript-syntax
    sidneys1.gitconfig
    ldez.ignore-files

    # Git
    codezombiech.gitignore
    eamodio.gitlens

    # Languages
    tamasfe.even-better-toml
    davidanson.vscode-markdownlint
    yzhang.markdown-all-in-one
    jnoortheen.nix-ide

    # Container
    ms-azuretools.vscode-containers
    ms-vscode-remote.remote-containers
    ms-vscode-remote.remote-wsl

    # VSC Functions
    ms-ceintl.vscode-language-pack-zh-hans
    alefragnani.project-manager
    christian-kohler.path-intellisense
    gruntfuggly.todo-tree
    mkhl.direnv
    smcpeak.default-keys-windows
  ];

  commonSettings = (loadUserSettings ./settings.json) // {
    "workbench.colorTheme" = lib.mkForce "Bearded Theme feat. Will";
  };
in
{
  options.dnix.programs.vscode = {
    enable = mkEnableOption "vscode";
  };

  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;

      profiles = {
        default = {
          extensions = commonExtensions;
          userSettings = commonSettings;
          enableExtensionUpdateCheck = false;
          enableUpdateCheck = false;
        };
        Nix = {
          extensions = commonExtensions;
          userSettings = commonSettings;
        };
        Cpp = {
          extensions = commonExtensions ++ (loadExtensions ./Cpp/extensions.nix);
          userSettings = commonSettings // (loadUserSettings ./Cpp/settings.json);
        };
        Python = {
          extensions = commonExtensions ++ (loadExtensions ./Python/extensions.nix);
          userSettings = commonSettings // (loadUserSettings ./Python/settings.json);
        };
        Rust = {
          extensions = commonExtensions ++ (loadExtensions ./Rust/extensions.nix);
          userSettings = commonSettings;
        };
        Web = {
          extensions = commonExtensions ++ (loadExtensions ./Web/extensions.nix);
          userSettings = commonSettings // (loadUserSettings ./Web/settings.json);
        };
        Zig = {
          extensions = commonExtensions ++ (loadExtensions ./Zig/extensions.nix);
          userSettings = commonSettings // (loadUserSettings ./Zig/settings.json);
        };
        Java = {
          extensions = commonExtensions ++ (loadExtensions ./Java/extensions.nix);
          userSettings = commonSettings;
        };
      };
    };

    services.vscode-server.enable = true;
  };
}
