{ ... }:

{
  sound.mediaKeys.enable = true;

  services.xserver = {
    displayManager.lightdm = {
      enable = true;
      greeters.mini = {
       enable = true;
       user = "vyorkin";
       extraConfig = ''
          [greeter]
          show-password-label = false
          show-input-cursor = true
          invalid-password-text = loh, pidr

          [greeter-hotkeys]
          mod-key = meta
          shutdown-key = s
          restart-key = r
          hibernate-key = h
          suspend-key = u

          [greeter-theme]
          # The font to use for all text
          font = "Sans"
          # The font size to use for all text
          font-size = 1em
          # The default text color
          text-color = "#080800"
          # The color of the error text
          error-color = "#F8F8F0"
          # An absolute path to an optional background image.
          # The image will be displayed centered & unscaled.
          background-image = ""
          # The screen's background color.
          background-color = "#1B1D1E"
          # The password window's background color
          window-color = "#F92672"
          # The color of the password window's border
          border-color = "#080800"
          # The width of the password window's border.
          # A trailing `px` is required.
          border-width = 2px
          # The pixels of empty space around the password input.
          # Do not include a trailing `px`.
          layout-space = 15
          # The color of the text in the password input.
          password-color = "#F8F8F0"
          # The background color of the password input.
          password-background-color = "#1B1D1E"
       '';
      };
    };

    # I use Home Manager to manage X session
  };
}
