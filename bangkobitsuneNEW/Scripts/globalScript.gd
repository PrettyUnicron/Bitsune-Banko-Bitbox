extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


#func _process(delta: float) -> void:
	#pass
	

func _getDistance(pos1: Vector2, pos2: Vector2):
	var Distance = pos1.distance_to(pos2)
	return Distance

	
func getOverlap(r1: float, r2: float, d: float) -> float:
	#No overlap
	if d >= r1 + r2:
		print("No overlap", " MISS!")
		return 0.0
		
	
	#for full and partial overlap
	#change in line 30 elif to 10.0 if partial overlap in line 41 is part1 + part2 + 3 for easier accuracy
	
	#One circle inside another
	elif d <= abs(r1 - r2) + 1.5: #can either be 1.0 or 1.5. Changing hitboxes may be better for improving accuracy
		print("Full overlap", " PERFECT!")
		var smallerArea = PI * min(r1, r2) ** 2
		var baseArea = PI * r1 ** 2
		return (smallerArea / baseArea) * 100.0
		
	#Partial overlap
	var part1 = r1**2 * acos((d**2 + r1**2 - r2**2) / (2 * d * r1))
	var part2 = r2**2 * acos((d**2 + r2**2 - r1**2) / (2 * d * r2))
	var part3 = 0.5 * sqrt((-d + r1 + r2) * (d + r1 - r2) * (d - r1 + r2) * (d + r1 + r2))
	print("Partial overlap", " GREAT!")
	var overlapArea = part1 + part2 - part3
	var baseArea = PI * r1 ** 2
	return (overlapArea / baseArea) * 100.0
