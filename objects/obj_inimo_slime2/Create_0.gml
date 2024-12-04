/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

range = 30;

dir = 0;

// Atualizando estrutura de sprites

sprite =
{
	attack : spr_slime2_attack,	
	death : spr_slime2_death,
	hurt : spr_slime2_hurt,
	idle : spr_slime2_idle,	
	walk : spr_slime2_walk	
};

// Criando estado de hunt

estado_attack.inicia = function()
{
	sprite_index = sprite.attack;
	image_index = 0;
	
	dir = point_direction(x, y, alvo.x, alvo.y);
}	

estado_attack.roda = function()
{
	if (image_index >= 7)
	{
		var _dir = point_direction(x, y, alvo.x, alvo.y);
		// Se movendo na direcao do player quando pulando
		x += lengthdir_x(1, dir);
		y += lengthdir_y(1, dir);
	}
	
	if (image_index >= image_number - 0.2)
	{
		troca_estado(estado_idle);	
	}
}

inicia_estado(estado_idle);

