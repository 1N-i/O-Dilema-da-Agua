perto_do_player = false;
menu_aberto = false;

if (!variable_global_exists("interagindo")) {
    global.interagindo = false;
}

//Sistema da Senha
digitos = [0, 0, 0, 0];        
senha_correta = [8, 3, 4, 6];  

separacao_digitos = 60;