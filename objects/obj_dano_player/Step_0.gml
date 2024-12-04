
var _lista = ds_list_create();

var _qtd = instance_place_list(x, y, obj_inimigo_pai, _lista, false);

// Pegar os inimigos da lista e passar para a lista de inimigos
for (var i = 0; i < ds_list_size(_lista); i++)
{
	
	// Pegando inimigo atual da lista
	var _atual = _lista[| i];
	
	// Checando se o inimigo atual não existe na lista de inimigos
	var _existe = array_contains(lista_inimigos, _atual);
	
	// Se o inimigo nao existe na lista, adicionar inimigo a lista
	if(!_existe)
	{
		array_push(lista_inimigos, _atual);
		// Dar dano
		with(_atual)
		{
			if (!dead)
			{
				// Chamando o metodo que lida com o dano
				lida_dano(, other.dano_poise);
			}
		}
	}
}

// Depois de usar a lista, zera-la
ds_list_destroy(_lista);