/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Ajuste Profundidade
depth = -bbox_bottom;

if (input_active) {
    // Captura teclas digitadas
    if (keyboard_check_pressed(vk_backspace)) {
        // Remove o último caractere
        input_text = string_delete(input_text, string_length(input_text), 1);
    }
    if (keyboard_check_pressed(vk_enter)) {
        // Verifica a resposta quando o jogador pressionar Enter
        if (input_text == "Eu sou você") {
            instance_destroy();  // Destrói o objeto se a resposta estiver correta
        } else {
            show_message("Resposta incorreta! Tente novamente.");
            input_active = false;  // Desativa a caixa de input
        }
    } else {
        // Captura caracteres digitados
        for (var i = vk_a; i <= vk_z; i++) {
            if (keyboard_check(i)) {
                input_text += chr(i);  // Adiciona a letra ao texto digitado
            }
        }
        // Você pode adicionar números, símbolos e outras teclas aqui se necessário
    }
}
