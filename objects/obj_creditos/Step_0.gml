if (keyboard_check(vk_space)) { //Acelera ao apertar espaço
    velocidade_atual = velocidade_rapida;
} else {
    velocidade_atual = velocidade_normal;
}

y_texto -= velocidade_atual;

//Volta pro menu após acabar os créditos
var altura_total_creditos = array_length(creditos) * espacamento_linhas;
if (y_texto < -altura_total_creditos) {
    room_goto(Amenu);
}