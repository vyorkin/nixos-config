{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    # programs.mbsync.enable = true;
    # programs.msmtp.enable = true;
    # programs.notmuch = {
    #   enable = true;
    #   hooks = { preNew = "mbsync --all"; };
    # };

    # accounts.email = {
    #   accounts.primary = {
    #     address = "vasiliy.yorkin@gmail.com";
    #     gpg = {
    #       key = "F9119EC8FCC56192B5CF53A0BF4F64254BD8C8B5";
    #       signByDefault = true;
    #     };
    #     imap.host = "imap.gmail.com";
    #     mbsync = {
    #       enable = true;
    #       create = "maildir";
    #     };
    #     msmtp.enable = true;
    #     notmuch.enable = true;
    #     primary = true;
    #     realName = "Vasiliy Yorkin";
    #     signature = {
    #       text = ''
    #         Best wishes, Mit besten Wünschen
    #         Vasiliy Yorkin
    #         https://keybase.io/vyorkin
    #       '';
    #       showSignature = "append";
    #     };
    #     passwordCommand = "mail-password";
    #     smtp = { host = "smtp.gmail.com"; };
    #     userName = "vasiliy.yorkin@gmail.com";
    #   };
    # };
  };
}
