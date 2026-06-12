//Desenha o item no chão com o sprite que você escolheu na room
draw_self();

//Desenha a letra "E" flutuando quando chegar perto
if (perto_do_player) {
    draw_set_font(-1);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    draw_text(x, y - 32, "[E]"); 
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}