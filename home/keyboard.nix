{ ... }:

{
  home-manager.users.vyorkin = {
    home.keyboard = {
      layout = "us,ru";
      model = "pc105";
      variant = "qwerty";
      options = [
        "grp:ctrl_shift_toggle"
        "grp_led:caps"
        "caps:ctrl_modifier"
      ];
    };
  };
}
