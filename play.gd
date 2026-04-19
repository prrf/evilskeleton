extends AnimatedSprite2D

var iscopy = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("instanced")
	self.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if iscopy == true:
		if self.is_playing() == false:
			self.queue_free()
	pass


func _on_node_2d_health_depleted() -> void:
	var copy = duplicate()
	copy.iscopy = true
	get_parent().add_child(copy)
	pass # Replace with function body.
