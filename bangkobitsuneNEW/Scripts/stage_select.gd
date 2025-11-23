extends Control


func _on_stage_1_pressed() -> void:
	SceneLoader.change_scene("res://Scenes/stage.tscn")


func _on_back_button_pressed() -> void:
	SceneLoader.change_scene("res://Scenes/main_menu.tscn")
