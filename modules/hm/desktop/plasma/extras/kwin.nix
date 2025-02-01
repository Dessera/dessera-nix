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

  inherit (lib)
    mkOption
    mkEnableOption
    mkIf
    mkMerge
    ;

  blurplus = kwin-effects-forceblur.packages.${pkgs.system}.default;
in
{
  options = {
    programs.plasma.kwin.effects = {
      blurplus = {
        enable = mkEnableOption "Enable BlurPlus";
        blurDecorations = mkOption {
          type = lib.types.bool;
          default = true;
          description = "Blur decorations";
        };
        blurMatching = mkOption {
          type = lib.types.bool;
          default = false;
          description = "Blur matching";
        };
        blurNonMatching = mkOption {
          type = lib.types.bool;
          default = true;
          description = "Blur non-matching";
        };
        fakeBlur = mkOption {
          type = lib.types.bool;
          default = true;
          description = "Fake blur";
        };
        paintAsTranslucent = mkOption {
          type = lib.types.bool;
          default = true;
          description = "Paint as translucent";
        };
        transparentBlur = mkOption {
          type = lib.types.bool;
          default = false;
          description = "Transparent blur";
        };
        blurStrength = mkOption {
          type = lib.types.int;
          default = 8;
          description = "Blur strength";
        };
        windowClasses = mkOption {
          type = lib.types.str;
          default = "";
          description = "Window classes";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = mkMerge [
      (mkIf kwinEffectsCfg.blurplus.enable [ blurplus ])
    ];

    programs.plasma.configFile = {
      kwinrc.Effect-blurplus = mkIf kwinEffectsCfg.blurplus.enable {
        BlurDecorations = kwinEffectsCfg.blurplus.blurDecorations;
        BlurMatching = kwinEffectsCfg.blurplus.blurMatching;
        BlurNonMatching = kwinEffectsCfg.blurplus.blurNonMatching;
        FakeBlur = kwinEffectsCfg.blurplus.fakeBlur;
        PaintAsTranslucent = kwinEffectsCfg.blurplus.paintAsTranslucent;
        TransparentBlur = kwinEffectsCfg.blurplus.transparentBlur;
        BlurStrength = kwinEffectsCfg.blurplus.blurStrength;
        WindowClasses = kwinEffectsCfg.blurplus.windowClasses;
      };

      kwinrc.Plugins.forceblurEnabled = mkIf kwinEffectsCfg.blurplus.enable true;
    };

    programs.plasma.kwin.effects = {
      translucency.enable = mkIf kwinEffectsCfg.blurplus.enable true;
      blur.enable = mkIf kwinEffectsCfg.blurplus.enable false;
    };
  };
}
