extends Control

# MenuTheme is a global variable

func _ready() -> void:
	MenuTheme.play_music_lvl()

func _on_button_pressed() -> void:
	MenuTheme.stop()
	get_tree().change_scene_to_file("res://stage.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://options.tscn")
