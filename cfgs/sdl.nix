{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    SDL
    SDL2

    SDL_gfx
    SDL2_gfx
    SDL_image
    SDL_mixer
    SDL_net
    SDL_sound
    SDL_stretch
    SDL_ttf
  ];
}
