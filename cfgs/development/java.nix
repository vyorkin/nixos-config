{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      jdk
      jre

      # ant
      # maven
      # eclipses.eclipse-platform

      # junit
    ];

    variables = {
      _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel";
    };
  };
}
