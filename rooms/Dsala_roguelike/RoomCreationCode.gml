// Para a música antiga se ela estiver tocando
if (audio_is_playing(background)) {
    audio_stop_sound(background);
}

if (!audio_is_playing(roguelike)) {
    audio_play_sound(roguelike, 10, true);
}