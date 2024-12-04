if(keyboard_check_direct(vk_enter) or video_get_status() == video_status_closed){
	room_goto(1)
	video_close();
}