extends Control


func _on_stage_1_pressed() -> void:
	SceneLoader.change_scene("res://Scenes/stage.tscn")



func _on_back_button_pressed() -> void:
	SceneLoader.change_scene("res://Scenes/MainScreen.tscn")


func _on_stage_2_pressed() -> void:
	SceneLoader.change_scene("res://Scenes/stage2.tscn")


func _on_stage_3_pressed() -> void:
	SceneLoader.change_scene("res://Scenes/stage3.tscn")
