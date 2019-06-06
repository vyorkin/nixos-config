{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".rustfmt.toml" = { source = ../dotfiles/rust/rustfmt.toml; };
    };
  };
}
