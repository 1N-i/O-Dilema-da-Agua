global.luz = 0.2; // intensidade da luz
global.jogo_pausado = false;
opcao_pause = 0;


display_set_gui_size(display_get_width(), display_get_height());
global.item_atual = "";
global.som_ligado = true;
// Reinicia o inventário no começo do jogo
global.inventario = [];

// Conta o total original de itens da sala atual
global.total_itens_sala = instance_number(obj_item_coletavel);
// Inicializa o timer da tela preta
global.tela_preta_timer = 0;


global.luz_salva = global.luz