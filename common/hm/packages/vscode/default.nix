{
  pkgs,
  ...
}:
let
  loadUserSettings = p: builtins.fromJSON (builtins.readFile p);
  loadExtensions = p: (import p pkgs);

  commonSettings = loadUserSettings ./common-settings.json;
  commonExtensions =
    (with pkgs.vscode-extensions; [
      jeff-hykin.better-nix-syntax
      jnoortheen.nix-ide
      smcpeak.default-keys-windows
      mkhl.direnv
      skellock.just
      ms-vscode-remote.remote-containers
      ms-vscode-remote.remote-wsl
    ])
    ++ (with pkgs.vscode-marketplace; [
      igorsbitnev.error-gutters
      eamodio.gitlens
      yzhang.markdown-all-in-one
      aaron-bond.better-comments
      usernamehw.errorlens
      oderwat.indent-rainbow
      christian-kohler.path-intellisense
      gruntfuggly.todo-tree
      ms-ceintl.vscode-language-pack-zh-hans
      miguelsolorio.fluent-icons
      vscode-icons-team.vscode-icons
      davidanson.vscode-markdownlint
      zhuangtongfa.material-theme
      alefragnani.project-manager
      ms-azuretools.vscode-containers
      leetcode.vscode-leetcode
    ]);
in
{
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
    };
  };

  home.packages = with pkgs; [
    nodejs
  ];
}
