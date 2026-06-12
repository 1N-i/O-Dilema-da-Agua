if (global.jogo_pausado) exit;

if (!menu_aberto) {
    var distancia = distance_to_object(obj_player);
    perto_do_player = (distancia <= 12);
    
    if (perto_do_player && keyboard_check_pressed(ord("E"))) {
        menu_aberto = true;
        global.interagindo = true; //Congela o mundo
    }
} else {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var clique = mouse_check_button_pressed(mb_left);
    
    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;
    
    var largura_total = 4 * separacao_digitos;
    var start_x = cx - (largura_total / 2) + (separacao_digitos / 2);
    
    if (clique) {
        for (var i = 0; i < 4; i++) {
            var dx = start_x + (i * separacao_digitos);
            
            //Área de clique da seta de Cima
            if (mx >= dx - 20 && mx <= dx + 20 && my >= cy - 60 && my <= cy - 20) {
                digitos[i] += 1;
                if (digitos[i] > 9) digitos[i] = 0;
            }
            
            //Área de clique da seta de Baixo
            if (mx >= dx - 20 && mx <= dx + 20 && my >= cy + 20 && my <= cy + 60) {
                digitos[i] -= 1;
                if (digitos[i] < 0) digitos[i] = 9;
            }
        }
        
        //Checagem de acerto
        if (digitos[0] == senha_correta[0] && 
            digitos[1] == senha_correta[1] && 
            digitos[2] == senha_correta[2] && 
            digitos[3] == senha_correta[3]) {
            
            var nova_porta = instance_create_layer(x, y - 7, layer, obj_trocaRoom);
            nova_porta.image_xscale = image_xscale;
            nova_porta.image_yscale = image_yscale;
            
            global.interagindo = false;
            instance_destroy();
            exit;
        }
    }
    
    if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("E"))) {
        menu_aberto = false;
        global.interagindo = false;
    }
}