extends Node2D

@onready var b1Rad = $AllButtons/Button1/CollisionShape2D.shape.radius
@onready var b2Rad = $AllButtons/Button2/CollisionShape2D.shape.radius
@onready var b3Rad = $AllButtons/Button3/CollisionShape2D.shape.radius
@onready var b4Rad = $AllButtons/Button4/CollisionShape2D.shape.radius
@onready var noteRad = $Note/CollisionShape2D.shape.radius
@onready var noteScenes = preload("res://Scenes/note.tscn")
@onready var note_pool = $NotePool
@export var BPM := 25
var beat_interval := 0.5 # spawn every 0.5s
var timer := 0.0


func _ready() -> void:
	#var pos1 = Vector2(2, 3)
	#var pos2 = Vector2(3, 2)
	#var distance = pos1.distance_to(pos2)
	#print(distance)
	#add_child(noteNodes)
	beat_interval = (60.0 / BPM)
	note_pool = $NotePool
	$MusicPlayer.play()
	#print(b1Rad)
	#print(noteRad)
	
	
var beat_count = 0
func _process(delta: float) -> void:
	$AllButtons._buttonInputs()
	
	if !$MusicPlayer.playing:
		return
	timer += delta
	if timer >= beat_interval:
		timer -= -beat_interval #-0.2
		beat_count += 1
		
		if beat_count % 18 == 0:
			var lane = randi_range(1,4)
			spawn_note(lane)
		#spawn_note(1)
		#spawn_note(2)
		#spawn_note(3)
		#spawn_note(4)
		
	



func _on_allButtons_button_1() -> void:
	#var pos1 = $AllButtons/Button1/CollisionShape2D.global_position
	
	#for note in note_pool.notes:
		#if note.active:
			#var pos2 = note.global_position
			##print("Note position:", note.global_position)
			#var distance = Globals._getDistance(pos1, pos2)
			##print(distance)
			#note_pool.activate_note_in_lane($Note, 1)
			#note_pool.get_first_note_in_lane(1)
			#var overlap = Globals.getOverlap(b1Rad, noteRad, distance)
			#print(overlap)
	
	
	var button_pos = $AllButtons/Button1.global_position
	var first_note = note_pool.get_first_note_in_lane(1)
	if first_note:
		var note_pos = first_note.global_position
		var distance = Globals._getDistance(button_pos, note_pos)
		var overlap = Globals.getOverlap(b1Rad, noteRad, distance)
		if overlap != 0.0: #!= 0.0
			note_pool.return_to_pool(first_note)
			#first_note.play_hit_animation()
	else:
		print("No notes in lane 1")		
	#var pos2 = $Note/CollisionShape2D.global_position
	#Globals._getDistance(pos1, pos2)
	
	
	
	
	
func _on_all_buttons_button_2() -> void:
	var button_pos = $AllButtons/Button2.global_position
	var first_note = note_pool.get_first_note_in_lane(2)
	if first_note:
		var note_pos = first_note.global_position
		var distance = Globals._getDistance(button_pos, note_pos)
		var overlap = Globals.getOverlap(b1Rad, noteRad, distance)
		print(overlap)
		if overlap != 0.0: #!= 0.0
			note_pool.return_to_pool(first_note)
	else:
		print("No notes in lane 2")



func _on_all_buttons_button_3() -> void:
	var button_pos = $AllButtons/Button3.global_position
	var first_note = note_pool.get_first_note_in_lane(3)
	if first_note:
		var note_pos = first_note.global_position
		var distance = Globals._getDistance(button_pos, note_pos)
		var overlap = Globals.getOverlap(b1Rad, noteRad, distance)
		print(overlap)
		if overlap != 0.0:
			note_pool.return_to_pool(first_note)
	else:
		print("No notes in lane 3")


func _on_all_buttons_button_4() -> void:
	var button_pos = $AllButtons/Button4.global_position
	var first_note = note_pool.get_first_note_in_lane(4)
	if first_note:
		var note_pos = first_note.global_position
		var distance = Globals._getDistance(button_pos, note_pos)
		var overlap = Globals.getOverlap(b1Rad, noteRad, distance)
		print(overlap)
		if overlap != 0.0:
			note_pool.return_to_pool(first_note)
	else:
		print("No notes in lane 4")






func spawn_note(lane):
	var note = note_pool.get_note()
	if note:
		#note.activate(Vector2(400, -100)) # start above screen
		var button = $AllButtons.get_child(lane - 1) if lane > 0 else $AllButtons.get_child(0)
		var spawn_pos = button.global_position + Vector2(0, -500)
		note.activate(spawn_pos)
		#note.activate(position)       # your existing activation
		#note_pool.activate_note_in_lane(note, lane)
		note_pool.activate_note_in_lane(note, lane)


func _on_music_player_finished() -> void:
	SceneLoader.change_scene("res://Scenes/results.tscn")
