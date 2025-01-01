{
  kwin-effects-forceblur,
  ...
}:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.plasma;
  inherit (lib) mkIf;

  blurplus = kwin-effects-forceblur.packages.${pkgs.system}.default;
in
{
  config = mkIf cfg.enable {
    home.packages = [
      blurplus
    ];

    programs.plasma.configFile = {
      kwinrc.Effect-blurplus = {
        BlurDecorations = true;
        BlurMatching = false;
        BlurNonMatching = true;
        FakeBlur = true;
        PaintAsTranslucent = true;
        TransparentBlur = false;
        BlurStrength = 8;
        WindowClasses = '''';
      };

      kwinrc.Plugins.forceblurEnabled = true;
    };
  };
}
