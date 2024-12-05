if (input_active) {
    if (string_length(text_input) < 30) {
        var key = keyboard_lastchar;
        if (key != "" && key != chr(vk_backspace)) {
            text_input += key;
        }
    }
    
    // Remove o último caractere com Backspace
    if (keyboard_check_pressed(vk_backspace) && string_length(text_input) > 0) {
        text_input = string_delete(text_input, string_length(text_input), 1);
    }
    
    if (keyboard_check_pressed(vk_enter)) {
	    input_active = false;
	    if (string_trim(text_input) == string_trim(resposta_correta)) {
	        room_goto(rm_principal);
	    } else {
			text_input = "";
	        mensagem_erro = true;  // Exibe a mensagem de erro
	        input_active = true;  // Reativa a entrada para corrigir a senha
	    }
	}
}