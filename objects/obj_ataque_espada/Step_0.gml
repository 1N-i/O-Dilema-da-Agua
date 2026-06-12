if (instance_exists(obj_player)) {
    // faz a espada seguir o player
    x = obj_player.x;
    y = obj_player.y;
    
    x += lengthdir_x(70, image_angle);
    y += lengthdir_y(70, image_angle);
    
    // checa a colisão
    var inimigo = instance_place(x, y, obj_inimigo);
    
    // Se encontrou um inimigo e ele não está invencível, ataca
    if (inimigo != noone && !inimigo.invencivel) {
        
        var lista = inimigos_atingidos;
        var indice = ds_list_find_index(lista, inimigo.id);
        
        if (indice == -1) {
            inimigo.vida_atual -= 25; 
            ds_list_add(lista, inimigo.id);
            
            // Ativa os estados no inimigo
            inimigo.invencivel = true;
            inimigo.tempo_congelado = 22.5;       
            inimigo.tempo_invencibilidade = 60;
        }
    }
// agora com o boss
var boss = instance_place(x, y, obj_boss);
    
// Se encontrou o boss e ele n tá invencível, tá na hora do pau
if (boss != noone && !boss.invencivel) {
        if (boss.sprite_index == spr_boss && floor(boss.image_index) == 7) {
        var lista = inimigos_atingidos;
        var indice = ds_list_find_index(lista, boss.id);
        
        if (indice == -1) {
            boss.vida_atual -= 25; 
            ds_list_add(lista, boss.id);
            
            // Ativa os estados no boss
            boss.invencivel = true; 
			boss.tempo_invencibilidade = 120;
			}
		}
    }
} else {
    instance_destroy();
}