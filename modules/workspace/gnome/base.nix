{ pkgs, ... }:

{
  # Enable a low-level configuration system and settings
  # management tool. Its main purpose is to provide a back end
  # to GSettings on platforms that don't already have
  # configuration storage systems. It is part of GNOME 3 and is
  # a replacement for GConf
  programs.dconf.enable = true;

  services = {
    # Packages whose D-Bus configuration files should be included
    # in the configuration of the D-Bus system-wide or
    # session-wide message bus
    dbus.packages = with pkgs; [ gnome3.dconf ];

    # Enable GNOME Virtual file system.
    # For the user this could mean that the same file manager
    # you use to browse your local files, could also be used to
    # browse files on a remote server
    gvfs.enable = true;

    # Provides geolocation services, that is, it lets
    # applications find the user's geographical position. A
    # mapping application could use this to present a "where am
    # I" view, for example
    geoclue2.enable = true;

    gnome3 = {
      core-os-services.enable = true;
      core-utilities.enable = true;
      evolution-data-server.enable = true;
      sushi.enable = true;
      tracker.enable = true;
      tracker-miners.enable = true;
      gnome-settings-daemon.enable = true;
      glib-networking.enable = true;
      gnome-keyring.enable = true;
      gnome-online-accounts.enable = true;
      gnome-online-miners.enable = true;
    };
  };

  environment.sessionVariables.XDG_CURRENT_DESKTOP = "X-Generic";

  home-manager.users.vyorkin = {
    home.activation.gnome = ''
      $DRY_RUN_CMD mkdir -p "$XDG_DATA_HOME/.npm-packages"
    '';

    dconf.settings = {
      "org/gnome/nautilus/icon-view" = {
        captions = [ "size" "date_modified" "none" ];
      };

      "org/gnome/nautilus/list-view" = {
        default-column-order = [
          "name"
          "size"
          "type"
          "owner"
          "group"
          "permissions"
          "where"
          "date_modified"
          "date_modified_with_time"
          "date_accessed"
          "recency"
          "starred"
          "detailed_type"
        ];
        default-visible-columns = [ "name" "size" "date_modified" "starred" ];
      };

      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "list-view";
        executable-text-activation = "display";
        search-filter-time-type = "last_modified";
        search-view = "list-view";
        show-image-thumbnails = "always";
        thumbnail-limit = 10;
      };

      "org/gnome/evince/default" = {
        inverted-colors = true;
      };

      "org/gnome/maps" = {
        night-mode = true;
        transportation-type = "car";
      };
    };
  };
}
