extends Node2D

const tile_size = 64.0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(tick)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func tick():
	$Sprite2D.position += Vector2.RIGHT * tile_size