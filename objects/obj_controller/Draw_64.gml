if (global.jogo_pausado) {
	global.luz = global.luz_salva;
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);

    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;

    var opcoes = [
    "Continuar",
    "Reiniciar",
	"Som: " + string(global.som_ligado ? "Ligado" : "Desligado"),
    "Sair"
    
	];


    for (var i = 0; i < array_length(opcoes); i++) {
        draw_set_color(i == opcao_pause ? c_yellow : c_white);
        draw_set_halign(fa_center);
        draw_text(cx, cy + i * 32, opcoes[i]);
    }
}

// Aplica efeito de escurecimento baseado em global.luz
draw_set_alpha(1 - global.luz); // quanto menor a luz, mais escuro
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

if (global.tela_preta_timer > 0) {
    global.tela_preta_timer -= 1;

    // Desenha tela preta cobrindo tudo
    draw_set_alpha(1);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
    draw_set_alpha(1);
}
