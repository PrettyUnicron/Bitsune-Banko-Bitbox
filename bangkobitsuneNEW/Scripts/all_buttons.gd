extends Node2D

@onready var button1 = $Button1
@onready var b1Sprite = $Button1/button1Sprite
@onready var b1Shape = $Button1/CollisionShape2D
@onready var b1Rad = b1Shape.shape.radius

@onready var button2 = $Button2
@onready var b2Sprite = $Button2/button2Sprite
@onready var b2Shape = $Button2/CollisionShape2D
@onready var b2Rad = b2Shape.shape.radius

@onready var button3 = $Button3
@onready var b3Sprite = $Button3/button3Sprite
@onready var b3Shape = $Button3/CollisionShape2D
@onready var b3Rad = b3Shape.shape.radius

@onready var button4 = $Button4
@onready var b4Sprite = $Button4/button4Sprite
@onready var b4Shape = $Button4/CollisionShape2D
@onready var b4Rad = b4Shape.shape.radius


signal Button1
signal Button2
signal Button3
signal Button4
signal AllButton

func _ready() -> void:
	pass 



func _buttonInputs():
	if (Input.is_action_just_pressed("1_Note")):
		print("button1")
		Button1.emit()
		#return b1Shape.global_position
	if (Input.is_action_just_pressed("2_Note")):
		print("button2")
		Button2.emit()
	if (Input.is_action_just_pressed("3_Note")):
		print("button3")
		Button3.emit()
	if (Input.is_action_just_pressed("4_Note")):
		print("button4")
		Button4.emit()
	if (Input.is_action_just_pressed("All_Note")):
		print("All buttons")

#func _input(event: InputEvent) -> void:
	#pass

func _process(delta: float) -> void:
	#_buttonInputs()
	pass
