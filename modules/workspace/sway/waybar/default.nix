{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    programs.waybar = {
      enable = true;
      systemd.enable = true;

      settings = [{
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-center = [ "sway/window" ];
        modules-right = [
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "sway/language"
          "clock"
          "tray"
        ];

        modules = {
          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
          };
          "sway/mode" = { format = ''<span style="italic">{}</span>''; };
          "tray" = { spacing = 10; };
          "clock" = {
            timezone = "Europe/Moscow";
            tooltip-format = ''
              <big>{:%Y %B}</big>
              <tt><small>{calendar}</small></tt>'';
            format-alt = "{:%Y-%m-%d}";
          };
          "cpu" = {
            format = "{usage}%";
            tooltip = false;
          };
          "memory" = { format = "{}% "; };
          "network" = {
            interface = "enp4s0";
            format-wifi = "{essid} ({signalStrength}%) ";
            format-ethernet = "{ifname} = {ipaddr}/{cidr}";
            format-linked = "{ifname} (No IP)";
            format-disconnected = "Disconnected";
            format-alt = "{ifname} = {ipaddr}/{cidr}";
          };
          "pulseaudio" = {
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = "{volume}% ";
            format-source-muted = "";
            format-icons = {
              "headphone" = "";
              "hands-free" = "";
              "headset" = "";
              "phone" = "";
              "portable" = "";
              "car" = "";
              "default" = [ "" "" "" ];
            };
            "on-click" = "pavucontrol-qt";
          };
        };
      }];

      style = ''
        * {
          border: none;
          border-radius: 0;
          font-family: "IBM Plex";
          font-size: 13px;
          min-height: 0;
        }

        window#waybar {
          background: #000000;
          color: #FFFFFF;
        }

        #window {
          font-weight: bold;
          font-family: "IBM Plex";
        }

        #workspaces button {
          padding: 0 5px;
          background: transparent;
          color: #FFFFFF;
          border-top: 1px solid transparent;
        }

        #workspaces button:hover {
          padding: 0 5px;
          background: #FFFF00;
          color: #000000;
        }

        #workspaces button.focused {
          border-top: 1px solid #FFFF00;
        }

        #mode {
          background: #0000FF;
          border-bottom: 3px solid #FFFFFF;
        }

        #clock, #cpu, #memory, #network, #pulseaudio, #tray, #mode {
          padding: 0 8px;
          margin: 0 2px;
        }

        #clock {
          font-weight: bold;
        }

        @keyframes blink {
          to {
              background-color: #FFFFFF;
              color: #000000;
          }
        }

        #battery.warning:not(.charging) {
          color: #FFFFFF;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }

        #cpu {
        }

        #memory {
        }

        #network {
        }

        #network.disconnected {
          background: #FF0000;
        }

        #pulseaudio {
        }

        #pulseaudio.muted {
          background: #444444;
        }

        #tray {
        }
      '';
    };
  };
}
