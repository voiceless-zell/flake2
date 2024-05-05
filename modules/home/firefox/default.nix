{ config, pkgs, theme, inputs, lib, ... }:
with lib;
  let
    cfg = config.modules.firefox;

in{
  options.modules.firefox = { enable = mkEnableOption "firefox";};
  config = mkIf cfg.enable {
  programs.firefox = {      
      enable = true;
      profiles = {
        default = {
          id = 0;
          name = "zell";
        };
      };
  };
  };
}
