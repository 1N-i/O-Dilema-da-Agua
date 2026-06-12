

// Alterna pause com ESC
if (keyboard_check_pressed(vk_escape)) {
	global.luz_salva = global.luz
    global.jogo_pausado = !global.jogo_pausado;
}

// Navegação no menu
if (global.jogo_pausado) {
    if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
        opcao_pause = max(opcao_pause - 1, 0);
    }
    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
        opcao_pause = min(opcao_pause + 1, 3);
    }

    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
        switch (opcao_pause) {
            case 0: // Continuar
                global.jogo_pausado = false;
                break;

            case 1: // Reiniciar
                room_goto(room);
                if (window_get_fullscreen()) {
                    window_set_fullscreen(true);
                    display_set_gui_size(display_get_width(), display_get_height());
                }
                break;
			case 2: // Som
			global.som_ligado = !global.som_ligado;
			audio_master_gain(global.som_ligado ? 1 : 0);
			break;
			
            case 3: // Sair
                game_end();
                break;
        }
    }
}


