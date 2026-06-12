// Evento Step do obj_transicao

if (estado == "fade_out") {
    // Aumenta a escuridão
    alpha += velocidade;
    
    // Se a tela ficou totalmente preta
    if (alpha >= 1) {
        alpha = 1;
        estado = "fade_in";
        room_goto(sala_destino); // Transita para a próxima sala
    }
} 
else if (estado == "fade_in") {
    // Diminui a escuridão (clareia a tela)
    alpha -= velocidade;
    
    // Se a tela clareou totalmente, o objeto cumpriu seu papel e se destrói
    if (alpha <= 0) {
        instance_destroy();
    }
}