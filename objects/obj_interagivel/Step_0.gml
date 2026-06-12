//Mede a distância baseado na borda
var distancia = distance_to_object(obj_player);

//Verifica qual é a direção configurada para este objeto
var direcao_correta = false;
switch (direcao_exigida) {
    case "baixo":    
        direcao_correta = (obj_player.y > y) && (abs(obj_player.x - x) < 32); 
        break;
    case "cima":     
        direcao_correta = (obj_player.y < y) && (abs(obj_player.x - x) < 32); 
        break;
    case "esquerda": 
        direcao_correta = (obj_player.x < x) && (abs(obj_player.y - y) < 32); 
        break;
    case "direita":  
        direcao_correta = (obj_player.x > x) && (abs(obj_player.y - y) < 32); 
        break;
    case "todas":    
        direcao_correta = true; 
        break;
}

perto_do_player = (distancia <= 10) && direcao_correta;

//Autodestruição só na cozinha e se a luz estiver ligada
if (autodestruir && room == Ccozinha && global.luz == 1) {
    instance_destroy();
}

//Interação
if (perto_do_player && keyboard_check_pressed(ord("E"))) {
    
    // 🚪 SEGURANÇA: Se este objeto tiver uma ação de mudança de fase, muda na hora!
    if (variable_instance_exists(id, "acao_ao_terminar")) {
        if (acao_ao_terminar == "proxima_fase") { 
            room_goto_next();
            exit; // Interrompe o script aqui para evitar criar caixas de diálogo fantasmas
        }
    }

    // Lógica do outro programador para Diálogos (Cozinha / Outros locais)
    if (room == Ccozinha) {
        if (global.luz != 1) {
            instance_create_layer(0, 0, "Instances", obj_dialogo, {
                falas: ["Tenho que ligar a luz primeiro"],
                origem: id
            });
        } else {
            instance_create_layer(0, 0, "Instances", obj_dialogo, {
                falas: falas_interacao,
                origem: id
            });
        }
    } else {
        instance_create_layer(0, 0, "Instances", obj_dialogo, {
            falas: falas_interacao,
            origem: id
        });
    }
}