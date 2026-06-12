if (perto_do_player) {
    //Configurações de texto centralizado
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    //Resets de segurança
    draw_set_font(-1);
    draw_set_alpha(1);
    draw_set_color(cor_texto);
    
    //"[E]" flutua 16px acima do centro do obj_
    draw_text(x, y - 16, "[E]");
    
    //Reseta as configurações padrões
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}