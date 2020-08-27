{ pkgs, ... }:

let

  # For shits and giggles, let's package the responsive theme
  responsiveTheme = pkgs.stdenv.mkDerivation {
    name = "responsive-theme";
    # Download the theme from the wordpress site
    src = pkgs.fetchurl {
      url = "http://wordpress.org/themes/download/responsive.1.9.7.6.zip";
      sha256 = "1g1mjvjbx7a0w8g69xbahi09y2z8wfk1pzy1wrdrdnjlynyfgzq8";
    };
    # We need unzip to build this package
    buildInputs = [ pkgs.unzip ];
    # Installing simply means copying all files to the output directory
    installPhase = "mkdir -p $out; cp -R * $out/";
  };

  # WordPress plugin 'akismet' installation example
  akismetPlugin = pkgs.stdenv.mkDerivation {
    name = "akismet-plugin";
    # Download the theme from the wordpress site
    src = pkgs.fetchurl {
      url = "https://downloads.wordpress.org/plugin/akismet.3.1.zip";
      sha256 = "sha256:1wjq2125syrhxhb0zbak8rv7sy7l8m60c13rfjyjbyjwiasalgzf";
    };
    # We need unzip to build this package
    buildInputs = [ pkgs.unzip ];
    # Installing simply means copying all files to the output directory
    installPhase = "mkdir -p $out; cp -R * $out/";
  };

  makeWPConfig = { name, root, aliases }: {
    name = name;
    value = {
      database = {
        host = "localhost";
        name = name;
        passwordFile = pkgs.writeText "wordpress-dbpass" "secret";
        createLocally = true;
      };
      themes = [ responsiveTheme ];
      plugins = [ akismetPlugin ];
      virtualHost = {
        adminAddr = "admin@localhost";
        serverAliases = aliases;
        documentRoot = root;
      };
    };
  };
in
{
  services.httpd.adminAddr = "admin@example.com";
  services.wordpress."company_web" = {
    database = {
      host = "localhost";
      name = "company_web";
      passwordFile = pkgs.writeText "wordpress-dbpass" "secret";
      createLocally = true;
    };
    themes = [ responsiveTheme ];
    plugins = [ akismetPlugin ];
    virtualHost = {
      adminAddr = "admin@localhost";
      serverAliases = ["company"];
    };
  };

  # services.wordpress = builtins.listToAttrs (map makeWPConfig [
  #   {
  #     name = "company_com";
  #     aliases = [ "company.local" "www.company.local" ];
  #   }
  #   {
  #     name = "blog_company_com";
  #     aliases = [ "blog.company.local" "www.blog.company.local" ];
  #   }
  # ]);
}
