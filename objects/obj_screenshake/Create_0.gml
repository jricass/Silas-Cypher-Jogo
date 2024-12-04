valor = 0;
ang = 0;

// Forma que altera a posição do viewport
shake_pos = function()
{
	
	// Definindo os limites da mudança de valor
	var _val = random_range(-valor, valor);
	
	// Fazendo valor voltar a 0
	if (valor != 0)
	{
		valor = lerp(valor, 0, .2);	
		
		// Tremendo a camera
		view_set_xport(0, _val);
		
		view_set_yport(0, _val);
	
		if (valor <= 0.1) 
		{
			valor = 0;
			
			view_set_xport(0, 0);
			view_set_yport(0, 0);
		}
	}
	
}
	
shake_ang = function()
{
	var _val = random_range(-ang, ang);
	
	if (ang != 0)
	{
		ang = lerp(ang, 0, .25);
		
		// tremendo
		camera_set_view_angle(view_camera[0], _val);
		
		if (ang <= 0.1)
		{
			ang = 0;
			// Garantindo que o angulo esta zerado
			camera_set_view_angle(view_camera[0], 0);
		}
	}
}