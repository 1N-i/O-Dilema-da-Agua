if (room_get_name(room) == "Dsala_roguelike") {
	//Posição
	var bx = 24; //Posição X
	var by = 24; //Posição Y
	var largura_max_pixels = 208; //Tamanho horizontal máximo
	var altura_barra = 32; //Altura barra de vida

	var largura_vermelho_vivo  = (vida_atual / vida_maxima) * largura_max_pixels;
	var largura_vermelho_claro = (vida_atraso / vida_maxima) * largura_max_pixels;

	//Fundo da barra
	draw_set_color(c_dkgray); //Cinza escuro
	draw_rectangle(bx, by, bx + largura_max_pixels, by + altura_barra, false);

	//Barra "fantasma"
	var cor_vermelho_claro = make_color_rgb(255, 120, 120);
	draw_set_color(cor_vermelho_claro);
	draw_rectangle(bx, by, bx + largura_vermelho_claro, by + altura_barra, false);

	//Barra de vida
	draw_set_color(c_red);
	draw_rectangle(bx, by, bx + largura_vermelho_vivo, by + altura_barra, false);

	//Moldura
	draw_sprite(spr_moldura_vida, 0, bx, by);

	//Reset para a cor padrão
	draw_set_color(c_white);
}


// Escurece ao sair da sala
if (alpha_fade > 0) {
    draw_set_alpha(alpha_fade);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
}

if (!variable_instance_exists(id, "alpha_entrada")) {
    alpha_entrada = 1; 
}

if (alpha_entrada > 0) {
    alpha_entrada -= 0.025; // Vai clareando aos poucos
    
    draw_set_alpha(alpha_entrada);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
}

draw_set_alpha(1);
draw_set_color(c_white);