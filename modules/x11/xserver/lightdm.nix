{
  services.xserver.displayManager.lightdm = {
    greeters.mini = {
      enable = true;
      user = "vyorkin";

      extraConfig = ''
        [greeter]
        show-password-label = true
        password-label-text = Welcome, Great Hacker
        invalid-password-text = Are you sure?
        show-input-cursor = false
        password-alignment = right

        [greeter-theme]
        font = "IBM Plex Mono"
        font-size = 14pt
        text-color = "#666666"
        error-color = "#FF0000"
        background-image = ""
        background-color = "#000000"
        window-color = "#000000"
        border-color = "#333333"
        border-width = 1px
        layout-space = 14
        password-color = "#666666"
        password-background-color = "#222222"
      '';
    };
  };
}
