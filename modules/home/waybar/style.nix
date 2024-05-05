{ config, lib, ... }:
with lib;
let
  cfg = config.modules.waybarstyle;
in{

  options.modules.waybarstyle = { enable = mkEnableOption "waybarstyle"; };
  config = mkIf cfg.enable {
  programs.waybar.style = ''
    * {
        font-weight: normal;
        font-size: 14px;
        min-height: 0;
        transition-property: background-color;
        transition-duration: 0.5s;
    }

    window#waybar {
        background-color: transparent;
    }

    window>box {
        margin-left: 5px;
        margin-right: 5px;
        margin-top: 1px;
        border: 2px solid ;
        border-radius: 0px;
        background-color: rgba(31, 31, 31, 1);
    }

    #workspaces {
        padding-left: 0px;
        padding-right: 4px;
        border-radius: 0px;
    }

    #workspaces button {
        padding-top: 5px;
        border-radius: 0px;
        padding-bottom: 5px;
        padding-left: 8px;
        padding-right: 8px;
    }

    tooltip {
        background: rgb(48, 45, 65);
    }

    tooltip label {
        color: rgb(217, 224, 238);
    }

    #custom-launcher {
        font-size: 16px;
        padding-left: 10px;
        padding-right: 6px;
        color: #6896BA;
    }

    #clock,
    #memory,
    #temperature,
    #cpu,
    #mpd,
    #custom-wall,
    #temperature,
    #backlight,
    #pulseaudio,
    #network,
    #battery,
    #disk,
    #idle_inhibitor {
        padding-left: 10px;
        padding-right: 10px;
        padding-top: 0px;
        padding-bottom: 0px;
        color: #B9B9B9;
    }
    #cava {
      padding-left: 10px;
      padding-right: 10px;
    }
    #tray {
        padding-right: 8px;
        padding-left: 10px;
    }
  '';
  };
}
