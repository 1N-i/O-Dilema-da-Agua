if (!global.jogo_pausado) {
    // Tamanho da tela para se adaptar
    var largura_tela = display_get_gui_width();
    var altura_tela = display_get_gui_height();

    // Define as posições da caixa de texto (parte inferior)
    var margem = 50;
    var altura_caixa = 150;
    var x1 = margem;
    var y1 = altura_tela - altura_caixa - margem;
    var x2 = largura_tela - margem;
    var y2 = altura_tela - margem;

    // Fundo da caixa
    draw_set_color(c_black);
    draw_rectangle(x1, y1, x2, y2, false);

    // Borda branca
    draw_set_color(c_white);
    draw_rectangle(x1, y1, x2, y2, true);

    // Fonte e texto
    draw_set_font(fonte);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    // Nome do personagem
    draw_set_color(c_yellow);
    draw_text(x1 + 20, y1 + 15, nome_personagem);

    // Texto da fala (com quebra automática)
    draw_set_color(c_white);
    draw_text_ext(x1 + 20, y1 + 45, texto_atual, 20, (x2 - x1) - 40);
}
