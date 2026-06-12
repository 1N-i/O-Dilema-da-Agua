//Só funciona se estiver na room certa
if (room != Bsala_puzzle) exit;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var clique = mouse_check_button_pressed(mb_left);

if (estado == "minimizado") {
    //Clicou no botão de abrir?
    if (clique && mx >= bot_x && mx <= bot_x + bot_tam && my >= bot_y && my <= bot_y + bot_tam) {
        estado = "aberto";
    }
} else if (estado == "aberto") {
    //Clicou no botão para fechar de volta?
    if (clique && mx >= bot_x && mx <= bot_x + bot_tam && my >= bot_y && my <= bot_y + bot_tam) {
        estado = "minimizado";
    }
    
    //Clicou em algum item dentro do inventário?
    if (clique) {
        for(var i = 0; i < array_length(global.inventario); i++) {
            var sx = inv_x + slot_margem + (i * (slot_tam + slot_margem));
            var sy = inv_y + slot_margem;
            
            //Verifica se o mouse está em cima deste slot
            if (mx >= sx && mx <= sx + slot_tam && my >= sy && my <= sy + slot_tam) {
                item_inspecionado = global.inventario[i];
                estado = "inspecionando";
            }
        }
    }
} else if (estado == "inspecionando") {
    //Se clicar em qualquer lugar da tela, fecha a inspeção
    if (clique) {
        estado = "aberto";
    }
}