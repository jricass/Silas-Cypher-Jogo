// Ajustando profundidade
depth = -y;

// Pegando inputs

up = keyboard_check(vk_up) or keyboard_check(ord("W"));
down = keyboard_check(vk_down) or keyboard_check(ord("S"));
right = keyboard_check(vk_right) or keyboard_check(ord("D"));
left = keyboard_check(vk_left) or keyboard_check(ord("A"));
attack = keyboard_check_pressed(vk_space) or mouse_check_button(mb_left);

// Ajustando a direção com base na direção que o player vai

// Rodando maquina de estados
roda_estado();