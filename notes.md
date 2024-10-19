# 10-19-2024

## Creating a new project
- Open Godot
  - Click "Create New"
  - Name your project
  - Click "Create folder"
  - Check "Compatibility"
  - Click "Create and Edit"
  
## Setting Up Your 2D Scene
- Create a new 2D Scene

## Adding the Sprite
- Select `Node2D` in your sceen tree (the menu to the left)
- Click the "+" button on the top left hand side
  - Search for `Sprite2D`
  - Click `Create`
- Click and Drag the `icon.svg` file from the FileSystem (the menu to the bottom left)
  onto the `Sprite2D` node you just created (in the sceen tree)

## Adding a Script
- Select the top `Node2D` node. Right click -> Attach Script
  - (Optional) rename your script
  - Click "Create and Edit"

## Coding the Script
Your file should look like this:

```gdscript
extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass
```

We need to update the `func _process(delta):` method to be code that moves our sprite.
To do that, we're going to increase the position of the node by `1.0` each frame.

Your new `func _process(delta):` should look like this:
```
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite2D.position += 10.0 * Vector2(1.0, 1.0) * delta
```
