 // Alterna com F11
if (keyboard_check_pressed(vk_f11)) {
    if (window_get_fullscreen()) {
    // ativa modo janela
    window_set_fullscreen(false);}	
	else {
    // ativa tela cheia
    window_set_fullscreen(true);}
}

