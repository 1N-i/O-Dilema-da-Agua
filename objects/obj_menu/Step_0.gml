// controle pelo teclas
var acima  = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var abaixo = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

if (acima) {
    index--;
    if (index < 0) {
        index = op_max - 1;
    }
}

if (abaixo) {
    index++;
    if (index > op_max - 1) {
        index = 0;
    }
}

// controle pelo rato (mouse)
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);

draw_set_font(fonte);

var mouse_em_cima = false;

// 2. Rodar o loop para checar se o mouse está em cima de alguma opção
for (var i = 0; i < op_max; i++) {
    var texto_y = y1 + (distancia * i);
    
    var largura_texto = string_width(opcoes[i]);
    var altura_texto  = string_height(opcoes[i]);
    
    var limite_esquerdo = x1 - (largura_texto / 2) - 10;
    var limite_direito  = x1 + (largura_texto / 2) + 10;
    var limite_topo     = texto_y - (altura_texto / 2) - 5;
    var limite_base     = texto_y + (altura_texto / 2) + 5;
    
    // Se o mouse estiver em cima, atualiza o index para o número correto
    if (m_x > limite_esquerdo && m_x < limite_direito && m_y > limite_topo && m_y < limite_base) {
        index = i;
		mouse_em_cima = true;
    }
}

var teclado_confirmar = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
var mouse_confirmar   = mouse_check_button_pressed(mb_left);

if (teclado_confirmar || (mouse_confirmar && mouse_em_cima)) {
    if (index == 0) {
        room_goto_next();
    } 
    else if (index == 1) {
       room_goto(Fcreditos)
    } 
    else if (index == 2) {
        game_end();
    }
}