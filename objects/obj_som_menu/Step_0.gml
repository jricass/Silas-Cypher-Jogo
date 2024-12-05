// Código para reproduzir o som na room
if (!audio_is_playing(snd_menu)) {
    audio_play_sound(snd_menu, 1, true);
}