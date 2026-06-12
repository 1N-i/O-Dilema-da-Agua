//Nome do jogo
draw_set_font(fonte); 
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_yellow);

var titulo_x = gui_largura / 2;
var titulo_y = gui_altura / 4; 

draw_text(titulo_x, titulo_y, titulo);

//Opções do menuzas
draw_set_font(fonte);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

for (var i = 0; i < op_max; i++) {
    if (index == i) {
        draw_set_color(c_grey);
    } else {
        draw_set_color(c_white);
    }
    
    draw_text(x1, y1 + (distancia * i), opcoes[i]);
}
    
draw_set_font(-1);
draw_set_halign(fa_left); 
draw_set_valign(fa_top);