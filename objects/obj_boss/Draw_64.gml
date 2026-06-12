if (room_get_name(room) == "Dsala_roguelike") {
	//Posição
	var bx = 683 - (312 / 2); //Posição X
	var by = 24; //Posição Y
	var largura_max_pixels = 312; //Tamanho horizontal máximo
	var altura_barra = 48; //Altura barra de vida

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
	draw_sprite(spr_moldura_vida_boss, 0, bx, by);

	//Reset para a cor padrão
	draw_set_color(c_white);
}