if (room != Bsala_puzzle) exit;

//Botão minimizado
draw_set_color(c_black);
draw_rectangle(bot_x, bot_y, bot_x + bot_tam, bot_y + bot_tam, false);

//Desenha a logo do inventário esticada para caber no botão
draw_sprite_stretched(spr_inventario_logo, 0, bot_x + 4, bot_y + 4, bot_tam - 8, bot_tam - 8);

//Barra preta
if (estado == "aberto" || estado == "inspecionando") {
    //Calcula o tamanho da barra preta baseado em quantos itens você tem + 1
    var qtd_slots_visiveis = max(4, array_length(global.inventario)); 
    var barra_largura = slot_margem + (qtd_slots_visiveis * (slot_tam + slot_margem));
    var barra_altura = (slot_margem * 2) + slot_tam;
    
    //Fundo Preto
    draw_set_color(c_black);
    draw_rectangle(inv_x, inv_y, inv_x + barra_largura, inv_y + barra_altura, false);
    
    //Fundo dos Slots e Desenho dos Itens
    var cor_amarelo_claro = make_color_rgb(255, 255, 180);
    
    for(var i = 0; i < array_length(global.inventario); i++) {
        var sx = inv_x + slot_margem + (i * (slot_tam + slot_margem));
        var sy = inv_y + slot_margem;
        
        //Desenha o quadrado amarelo
        draw_set_color(cor_amarelo_claro);
        draw_rectangle(sx, sy, sx + slot_tam, sy + slot_tam, false);
        
        //Puxa a imagem do item salvo na mochila
        var spr_do_item = global.inventario[i];
        
        //Usa stretched para o item não vazar do quadrado amarelo, independente do tamanho original
        draw_sprite_stretched(spr_do_item, 0, sx + 8, sy + 8, slot_tam - 16, slot_tam - 16);
    }
}

//Inspeção do item
if (estado == "inspecionando") {
    //Escurece a tela toda um pouquinho
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1); //Reseta a opacidade
    
    //Desenha o item gigante no centro da tela
    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;
    var tamanho_gigante = 256; //Tamanho do item na tela
    
    draw_sprite_stretched(item_inspecionado, 0, cx - (tamanho_gigante/2), cy - (tamanho_gigante/2), tamanho_gigante, tamanho_gigante);
    
    //Texto de Ajuda
    draw_set_font(-1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(cx, cy + (tamanho_gigante/2) + 20, "Clique para fechar");
    draw_set_halign(fa_left);
}

//Limpeza para não bugar outras partes do jogo
draw_set_color(c_white);