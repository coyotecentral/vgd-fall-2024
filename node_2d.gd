extends Node2D

const tile_size = 64.0
var direction = Vector2.RIGHT

var sprite = preload("res://segment.tscn")
var snake = []


# Called when the node enters the scene tree for the first time.
func _ready():
	snake.push_front($Sprite2D)
	spawn_segment(Vector2())
	spawn_segment(Vector2())
	$Timer.timeout.connect(tick)
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var next_direction = Input.get_vector("left", "right", "up", "down")
	var dot = direction.dot(next_direction)
	if next_direction.length() and dot == 0:
		direction = next_direction


func tick():
	var next_pos = direction * tile_size
	# snake[0] gets the first segment of our snake
	var head_pos = snake[0].position
	spawn_segment(head_pos + next_pos)
	if snake[0].position != $Apple.position:
		snake.pop_back().queue_free()

# This function is going to create a new
# snake segment and add it to the world. We're
# also going to add it to our snake array.
func spawn_segment(position):
	# Create an "instance" of the scene
	var new_segment = sprite.instantiate()
	add_child(new_segment)
	snake.push_front(new_segment)
	new_segment.position = position
