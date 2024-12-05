// Iniciar Variáveis

max_vida = 5;
vida = max_vida;

poise_max = 5;
poise = poise_max;

meu_dano = noone;
dano_poise = 6;

imageindex = 0;

#region dialogo



#endregion

// Metodo de interação com a fogueira (SAVE)
ativa_fogueira = function()
{
	// Usando a dir para saber se estou colidindo com a fogueira
	var _x = lengthdir_x(2, dir * 90);
	var _y = lengthdir_y(2, dir * 90);
	
	var _fog = instance_place(x + _x, y + _y, obj_fogueira);
	
	if (_fog)
	{
		if (keyboard_check_pressed(vk_enter))
		{
			with(_fog)
			{
				// Se a fogueira esta idle, ativo ela
				if (estado_atual == estado_idle)
				{
					troca_estado(estado_start);	
				}
			}
		}
	}
	
}
	
// Iniciando primeiro estado
estado_idle = new estado();

// Iniciando estado walk
estado_walk = new estado();

// Iniciando estado de ataque;
estado_attack = new estado(); 

// Iniciando estado de hit
estado_hit = new estado();

// Iniciando estado de morte
estado_death = new estado();

#region lida_dano

lida_dano = function(_dano = 1, _poise = 1)
{
	if (estado_atual == estado_death) return;
	// Perdendo Vida
	vida -= _dano;
	
	poise = max(poise - _poise, 0);
	
	// Se perdi toda a minha vida
	if (vida <= 0)
	{
		troca_estado(estado_death);
		return;
	}
	
	// Se ainda tenho vida, vou para o estado de hit
	// E nao estou no estado de ataque
	// A nao ser que eu esteja sem poise
	// Se ainda tenho poise e nao estou atacando 
	if (poise <= 0 or estado_atual != estado_attack)
	{
		troca_estado(estado_hit);
	}
}

#endregion

#region estado_idle

// Estado idle precisa de um "inicia"
estado_idle.inicia = function()
{
	
	// Definindo sprite atual com base na direção que o player olha
	var _sprite = define_sprite(dir, spr_player_idle_side, spr_player_idle_front, spr_player_idle_back);
	
	// Ajustando sprite
	sprite_index = _sprite;
	
	// Garantindo que a animação começa do primeiro frame
	image_index = 0;
}

estado_idle.roda = function()
{
	ativa_fogueira();
	
	// Achando a condição para sair deste estado
	
	// SE estiver em movimento, então estado = walk
	if (up xor down or left xor right) 
	{
		troca_estado(estado_walk);
	}
	
	// Condição para ir para o estado de attack
	if (attack)
	{
		troca_estado(estado_attack);	
	}
}

#endregion

#region estado_walk

estado_walk.inicia = function()
{
	dir = (point_direction(0, 0, right - left, down - up) div 90);
	// Definindo Sprite
	var _sprite = define_sprite(dir, spr_player_walk_side, spr_player_walk_front, spr_player_walk_back);	

	sprite_index = _sprite;
	
	image_index = 0;
	
}

estado_walk.roda = function()
{
	
	dir = (point_direction(0, 0, velh, velv) div 90);
	// Condição para sair do estado
	// Se estou parado, eu vou para idle

	ativa_fogueira();
	
	// Ajustando o lado que ele olha
	if (velh != 0)
	{
		image_xscale = sign(velh)
	}
	
	// Definindo sprite
	sprite_index = define_sprite(dir, spr_player_walk_side, spr_player_walk_front, spr_player_walk_back);
	
	// Aplicando inputs à velocidade
	// Resultado vai ser 0, -1 ou 1
	velv = (down - up) * vel;

	// velocidade horizontal
	velh = (right - left) * vel;
	
	if (velh == 0 and velv == 0)
	{
		troca_estado(estado_idle);	
	}
	
	// Indo para o estado de ataque
	if (attack)
	{
		troca_estado(estado_attack);	
	}
	
}

#endregion

#region estado_attack

estado_attack.inicia = function()
{
	// Definindo a sprite
	sprite_index = define_sprite(dir, spr_player_attack_side, spr_player_attack_front, spr_player_attack_back);
	
	image_index = 0;
	
	velh = 0;
	velv = 0;
	
	// Criando dano
	var _x = x + lengthdir_x(16, dir * 90);
	var _y = y + lengthdir_y(16, dir * 90)
	
	meu_dano = instance_create_depth(_x, _y, depth, obj_dano_player);
	
	// Passando poise para o dano
	meu_dano.dano_poise = dano_poise;
}

// Configurando estado de attaque
estado_attack.roda = function()
{
		
	// Saindo do ataque quando ele acabar
	if (image_index >= image_number - 0.4)
	{
		// Indo para o estado de parado
		troca_estado(estado_idle);
	}
		
}

estado_attack.finaliza = function()
{
	
	// Encerro meu dano
	instance_destroy(meu_dano);
	
}

#endregion

#region estado_hit

estado_hit.inicia = function()
{
	sprite_index = define_sprite(dir, spr_player_hit_side, spr_player_hit_front, spr_player_hit_back);
	image_index = 0;
	
	velh = 0;
	velv = 0;
	
	imageindex = 0;
	
	obj_screenshake.ang = 5;
	obj_screenshake.valor += 20;
}

estado_hit.roda = function()
{
	// saindo do estado ao final da animação
	if (image_index > imageindex)
	{
		imageindex = image_index;	
	}
	
	// Se o meu imageindex for maior que o image_index 
	// Isso quer dizer que o image_index foi zerado
	// Logo, ele encerrou a animação
	if (imageindex > image_index)
	{
		troca_estado(estado_idle);
	}	
	
}

#endregion

#region estado_death

estado_death.inicia = function()
{
	sprite_index = spr_player_death;
	image_index = 0;
	imageindex = 0;
}

estado_death.roda = function()
{
	if (image_index > imageindex)
	{
		imageindex = image_index;
	}
	
	if (imageindex > image_index)
	{
		image_index = image_number - 1;	
		
		// Mostrando game over
		if (global.game_over == false)
		{
			// Instanciar no x e y da camera
			var _cam_x = camera_get_view_x(view_camera[0]);
			var _cam_y = camera_get_view_y(view_camera[0]);
			
			layer_sequence_create("Sequence", _cam_x, _cam_y, sq_morreu);
			
			// Avisando que o game over ocorreu
			global.game_over = true;
			
		}
	}
}

#endregion

#region iniciando_variaveis
// Controles iniciados sem valor
up = noone;
down = noone;
left = noone;
right = noone;
attack = noone;

// Variáveis de movimento
// Iniciado Parado
velh = 0;
velv = 0;

// Velocidade do Jogador
vel = 2;

// Controlando direção que o player olha
dir = 0;

#endregion

// Iniciando minha maquina de estados
inicia_estado(estado_idle);
