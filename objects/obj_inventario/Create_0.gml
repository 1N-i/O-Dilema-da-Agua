// Garante que a mochila global exista
if (!variable_global_exists("inventario")) {
    global.inventario = [];
}

// Salva o total original de itens da sala
global.total_itens_sala = instance_number(obj_item_coletavel);

estado = "minimizado";  //Pode ser: "minimizado", "aberto", "inspecionando"
item_inspecionado = -1; //Vai guardar o sprite do item sendo olhado de perto

//Posições da Interface na tela
bot_x = 20; //Posição X do botão minimizado
bot_y = 20; //Posição Y do botão minimizado
bot_tam = 64; //Tamanho do quadrado preto

inv_x = 20; //Posição X da barra do inventário
inv_y = 90; //Posição Y da barra (logo abaixo do botão)
slot_tam = 64; //Tamanho de cada quadrado amarelo
slot_margem = 10; //Espaço entre um quadrado e outro