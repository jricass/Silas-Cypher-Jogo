// Ajuste Profundidade
depth = -bbox_bottom;


if (transparente)
{
// Transparencia quando player passar por trás
// Checando se o player existe
if (instance_exists(obj_player))
{
		// Checando se o player está mais alto
		if (obj_player.y < y)
		{
			// Checando se o player está no ponto correto
			if (point_in_rectangle(obj_player.x, obj_player.y, bbox_left - 10, bbox_top - 25, bbox_right + 10, bbox_top))
			{
				// Ficando Transparente
				image_alpha = lerp(image_alpha, .4, .05);
			}
			else
			{	
				image_alpha = lerp(image_alpha, 1, .1);	
			}
		}
	}
}