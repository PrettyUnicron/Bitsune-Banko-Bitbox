extends Control





func _on_replay_button_pressed() -> void:
	SceneLoader.change_scene("res://Scenes/stage.tscn")




func _on_exit_button_pressed() -> void:
	SceneLoader.change_scene("res://Scenes/main_menu.tscn")
