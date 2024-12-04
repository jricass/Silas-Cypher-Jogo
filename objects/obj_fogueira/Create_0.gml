img_ind = 0;

// Criando estados

estado_idle = new estado();

estado_start = new estado();

estado_on = new estado();


// Estado idle
estado_idle.inicia = function()
{
	sprite_index = spr_fogueira_idle;	
}

// Estado start
estado_start.inicia = function()
{
	sprite_index = spr_fogueira_start;	
	
	// Avisando que eu tenho que reiniciar os inimigos
	// Zerar as infos da room
	global.rooms_info = array_create(array_length(asset_get_ids(asset_room)), noone);
	
	// Avisando que a fogueira é true
	global.fogueira = true;
	
}

estado_start.roda = function()
{
	// Quando a animação acabar ir para o estado on	
	// Checando se a animação terminou
	if (image_index >= img_ind)
	{
		img_ind = image_index;	
	}
	else 
	{
		// Reiniciando a room
		room_restart();
		// Acabou animação
		troca_estado(estado_on);
	}
}

estado_on.inicia = function()
{
	sprite_index = spr_fogueira_burning;
	
	// fogueira ja foi
	// global.fogueira = false;
}

estado_on.roda = function()
{
	global.fogueira = false;	
}

var _estado_inicial = global.fogueira == true? estado_on : estado_idle;


// Iniciando ela no estado inicial 

inicia_estado(_estado_inicial);