/// @description Se empurrando para fora

// Achando a direção que devo ser empurrado
var _dir = point_direction(other.x, other.y, x, y);

var _velh = lengthdir_x(1, _dir);
var _velv = lengthdir_y(1, _dir);

// Checando se vou entrar em alguma parede
if(!place_meeting(x + _velh, y + _velv, obj_colisor))
{
	x += _velh;
	y += _velv;
}