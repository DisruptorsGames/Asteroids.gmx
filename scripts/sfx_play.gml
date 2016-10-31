///sfx_play(soundid, priority, loops)
if (global.sound && !audio_is_playing(argument0))
    audio_play_sound(argument0, argument1, argument2);

