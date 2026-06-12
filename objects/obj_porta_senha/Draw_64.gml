if (!menu_aberto) exit;

var cx = display_get_gui_width() / 2;
var cy = display_get_gui_height() / 2;

//Escurece a tela
draw_set_color(c_black);
draw_set_alpha(0.75); //Efeito de foco escurecido
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

//Desenha a caixinha do Painel
draw_set_alpha(0.95);
draw_rectangle(cx - 140, cy - 90, cx + 140, cy + 90, false);
draw_set_color(c_white);
draw_rectangle(cx - 140, cy - 90, cx + 140, cy + 90, true);

//Configurações de Texto
draw_set_font(-1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var largura_total = 4 * separacao_digitos;
var start_x = cx - (largura_total / 2) + (separacao_digitos / 2);

for (var i = 0; i < 4; i++) {
    var dx = start_x + (i * separacao_digitos);
    
    //Desenha triângulo
    draw_set_color(c_yellow);
    draw_triangle(dx - 12, cy - 35, dx + 12, cy - 35, dx, cy - 50, false);
    
    //Número
    draw_set_color(c_white);
    draw_text(dx, cy, string(digitos[i]));
    
    //Desenha triângulo
    draw_set_color(c_yellow);
    draw_triangle(dx - 12, cy + 35, dx + 12, cy + 35, dx, cy + 50, false);
}

//Rodapé
draw_set_color(c_gray);
draw_text(cx, cy + 75, "Pressione ESC ou E para fechar");

//Resets normais
draw_set_alpha(1.0);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);