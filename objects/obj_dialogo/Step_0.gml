// Pausa o diálogo se o jogo estiver pausado
if (global.jogo_pausado) {
    exit;
}

// Efeito máquina de escrever
if (letra_atual < string_length(texto_completo)) {
    letra_atual += velocidade_texto;
    texto_atual = string_copy(texto_completo, 1, floor(letra_atual));
}

// Avançar e fechar texto com Espaço
if (keyboard_check_pressed(vk_space)) {
    if (letra_atual < string_length(texto_completo)) {
        letra_atual = string_length(texto_completo);
        texto_atual = texto_completo;
    } else {
        fala_atual++;
        if (fala_atual < array_length(falas)) {
            texto_completo = falas[fala_atual];
            letra_atual = 0;
            texto_atual = "";
        } else {
            // 🔹 Diálogo terminou
            if (instance_exists(origem) && origem.controla_luz) {
                global.luz = 0.2; // apaga a luz

                // Ativa o vulto (torna visível)
                if (instance_exists(obj_player_vulto)) {
                    obj_player_vulto.visible = true;
                } else {
                    // Se ainda não existir, cria invisível e já ativa
                    var vulto = instance_create_layer(obj_player.xstart, obj_player.ystart, "Instances", obj_player_vulto);
                    vulto.visible = true;
                }
            }

            instance_destroy(); // fecha o diálogo
        }
    }
}
