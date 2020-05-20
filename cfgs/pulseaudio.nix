{ pkgs, config, ... }:

# PulseAudio is a popular sound server for Linux.
# It is now required by a number of applications, and should be
# enabled if audio support is desired on NixOS.
# Enabling PulseAudio is sufficient to enable audio support on NixOS in most cases.

# You may need to add users to the audio group for them to be able to use audio devices:
# users.extraUsers.alice.extraGroups = [ "audio" ... ];

# More info: https://nixos.wiki/wiki/PulseAudio

{
  hardware.pulseaudio = {
    enable = true;

    # Only the full build has Bluetooth support
    package = pkgs.pulseaudioFull;
    
    # While pulseaudio itself only has support for the
    # SBC bluetooth codec there is out-of-tree support for AAC, APTX, APTX-HD and LDAC.
    extraModules = [pkgs.pulseaudio-modules-bt];

    # For compatibility with 32-bit applications
    support32Bit = true;

    # It seems like the Scarlett reports a stereo mic input,
    # regardless of the actual capabilities of the mic.
    # This can cause a variety of effects, such as a 100% left
    # channel recording, distortion or, in my case, a static noise on
    # the right channel (might have been the 48V phantom power).
    # Creating a remapped pulseaudio input was the most elegant solution.

    # The following extra config lines tell pulseaudio to create a
    # remapped microphone source that only contains the left channel of
    # the original and is thus a mono source. Make sure to adjust the
    # master option according to the output from pacmd and don’t forget to
    # remove the brackets! The second line is optional and automatically sets the
    # default source to our new redirected source.

    # Run
    # pacmd list-sources | grep name:
    # to get a list of available sources on your system.
    # Look for the line that corresponds to your Scarlett.
    extraConfig = "
    load-module module-remap-source master=alsa_input.usb-Focusrite_Scarlett_Solo_USB-00.analog-stereo source_name=Mic-Mono master_channel_map=left channel_map=mono
    # Optional: Select new remap as default
    set-default-source Mic-Mono
    ";
  };

  environment.systemPackages = with pkgs; [
    pasystray
    pavucontrol
    pulsemixer
  ];
}
