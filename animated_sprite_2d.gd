extends Node2D

@onready var oldsprite = $AnimatedSprite2D
@onready var newsprite = oldsprite.duplicate()
signal health_depleted

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_window().set_mouse_passthrough_polygon($Polygon2D.polygon)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		health_depleted.emit()
		pass


func _on_timer_timeout() -> void:
	var random = randi_range(1,10000)
	print(random)
	if random == 10000:
		health_depleted.emit()
