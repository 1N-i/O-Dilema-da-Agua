// Verifica se o player existe
if (instance_exists(global.player)) {
    var distancia = point_distance(x, y, global.player.x, global.player.y);
    var direcao_correta = false;

    // Verifica direção exigida
    switch (direcao_exigida) {
        case "baixo":
            direcao_correta = (global.player.y > y) && (abs(global.player.x - x) < 32);
            break;
        case "todas":
            direcao_correta = true;
            break;
    }

    // Define se o player está perto
    perto_do_player = (distancia <= 120) && direcao_correta;

    // Interação com tecla E
    if (perto_do_player && keyboard_check_pressed(ord("E"))) {
        if (global.luz = 1) {
            global.luz = 0.2;
            rotacao = 0;
        } else {
            global.luz = 1;
            rotacao = 180;
        }
    }
}
