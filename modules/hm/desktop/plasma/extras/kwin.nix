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
  cfg = config.programs.plasma;
  kwinEffectsCfg = cfg.kwin.effects;

  inherit (lib) mkEnableOption mkIf mkMerge;

  blurplus = kwin-effects-forceblur.packages.${pkgs.system}.default;
in
{
  options = {
    programs.plasma.kwin.effects = {
      blurplus = {
        enable = mkEnableOption "Enable BlurPlus";
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = mkMerge [
      (mkIf kwinEffectsCfg.blurplus.enable [ blurplus ])
    ];

    programs.plasma.configFile = {
      kwinrc.Effect-blurplus = mkIf kwinEffectsCfg.blurplus.enable {
        BlurDecorations = true;
        BlurMatching = false;
        BlurNonMatching = true;
        FakeBlur = true;
        PaintAsTranslucent = true;
        TransparentBlur = false;
        BlurStrength = 8;
        WindowClasses = '''';
      };

      kwinrc.Plugins.forceblurEnabled = mkIf kwinEffectsCfg.blurplus.enable true;
    };

    programs.plasma.kwin.effects = {
      translucency.enable = mkIf kwinEffectsCfg.blurplus.enable true;
      blur.enable = mkIf kwinEffectsCfg.blurplus.enable false;
    };
  };
}
