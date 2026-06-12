var largura_tela = display_get_gui_width();

//Configurações de estilo
draw_set_halign(fa_center); //Centraliza o texto horizontalmente
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(fonte); //Fonte de texto

for (var i = 0; i < array_length(creditos); i++) {
    var pos_y_linha = y_texto + (i * espacamento_linhas);
    if (pos_y_linha > -50 && pos_y_linha < display_get_gui_height() + 50) {
        draw_text(largura_tela / 2, pos_y_linha, creditos[i]);
    }
}

draw_set_halign(fa_left); //Reseta o alinhamento para não bugar outros textos