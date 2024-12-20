extends Node2D

const tile_size = 64.0
var direction = Vector2.RIGHT

var sprite = preload("res://segment.tscn")
var snake = []
var score = 0


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
	else:
		move_apple()
		score = score + 1
		$Label.text = "Score %d" % score
	if check_collision():
		$Timer.paused = true
		$GameOver.set_deferred("visible", true)
		print("End the game")

# This function is going to create a new
# snake segment and add it to the world. We're
# also going to add it to our snake array.
func spawn_segment(position):
	# Create an "instance" of the scene
	var new_segment = sprite.instantiate()
	add_child(new_segment)
	snake.push_front(new_segment)
	new_segment.position = position

func move_apple():
	$Apple.position = random_position() * tile_size

func random_position():
	var vector = Vector2(randi_range(0, 10), randi_range(0, 10))
	return vector

func check_collision():
	var head = snake[0]
	for segment in snake.slice(1):
		if segment.position == head.position:
			return true
	return false