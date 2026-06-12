// Variáveis Genéricas (Essas serão alteradas na Room)
// Array de falas padrão
falas_interacao = [
    "Não há nada de interessante aqui."
];

cor_texto = c_white; // Cor padrão do "[E]"

// Direção padrão (pode ser "cima", "baixo", "esquerda", "direita" ou "todas")
direcao_exigida = "baixo"; 

// Controle do sistema
perto_do_player = false;
controla_luz = false;

// Flag que define se este objeto deve se autodestruir
autodestruir = false; //Você altera para true no Creation Code da instância específica
acao_ao_terminar = "nenhuma"