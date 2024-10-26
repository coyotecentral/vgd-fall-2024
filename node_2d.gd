extends Node2D

const tile_size = 64.0
var direction = Vector2.RIGHT


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(tick)
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var next_direction = Input.get_vector("left", "right", "up", "down")
	var dot = direction.dot(next_direction)
	if next_direction.length() and dot == 0:
		direction = next_direction


func tick():
	$Sprite2D.position += direction * tile_size