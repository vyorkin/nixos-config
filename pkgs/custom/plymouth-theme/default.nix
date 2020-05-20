{ stdenv, fetchgit, writeTextFile }:

let
  config_file = writeTextFile {
    name = "angular.plymouth";
    text = ''
      [Plymouth Theme]
      Name=angular
      Description=display kinda fireworks
      Comment=created By Aditya Shakya (@adi1090x)
      ModuleName=script

      [script]
      ImageDir=etc/plymouth/themes/angular
      ScriptFile=etc/plymouth/themes/angular/angular.script
    '';
  };
in stdenv.mkDerivation rec {
  name = "angular";

  src = fetchGit {
    url = "https://github.com/adi1090x/plymouth-themes";
    rev = "19139ac5063a89f7f344a18876c17908b65b7c7b";
  };

  buildInputs = [ stdenv ];

  configurePhase = ''
    install_path=$out/share/plymouth/themes/
    mkdir -p $install_path
  '';

  buildPhase = ''
    substitute ${config_file} "pack_1/angular/angular.plymouth"
  '';

  installPhase = ''
    cd pack_1 && cp -r angular $install_path
  '';

  meta = with stdenv.lib; { platfotms = platforms.linux; };
}
