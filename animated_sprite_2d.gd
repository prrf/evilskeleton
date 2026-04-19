extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_window().mouse_passthrough = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass


func _on_timer_timeout() -> void:
	if randi_range(1,10000) == 10000:
		self.play("default")
