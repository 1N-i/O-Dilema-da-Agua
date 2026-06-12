if (perto_do_player && !menu_aberto) {
    draw_set_font(-1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    draw_text(x, y - 32, "[E]");
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}