// Inherit the parent event
event_inherited();

sprite =
{
	attack : spr_slime3_attack,	
	death : spr_slime3_death,
	hurt : spr_slime3_hurt,
	idle : spr_slime3_idle,	
	walk : spr_slime3_walk	
};

// Direção
dir = 0;

image_xscale = 1.5;
image_yscale = 1.5;

#region estado_hunt

estado_hunt.inicia = function()
{

	// Definindo Sprite
	sprite_index = sprite.walk;
	image_index = 0;
	
	// Criando meu aviso
	
	cria_aviso();
	
	if (instance_exists(obj_player))
	{
		alvo = obj_player.id;
		dir = point_direction(alvo.x, alvo.y, x, y);
	}
}

estado_hunt.roda = function()
{
	if (!instance_exists(alvo))
	{
		troca_estado(estado_idle);
		exit;
	}
	
	// Fugindo do Player
	// Definindo velocidade para fugir
	velh = lengthdir_x(1, dir);
	velv = lengthdir_y(1, dir);
	
	// Olhando para o lado certo
	if (velh != 0) xscale = sign(velh);
}

#endregion

inicia_estado(estado_idle);