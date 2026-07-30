extends Node2D

@onready var oldsprite = $AnimatedSprite2D
@onready var newsprite = oldsprite.duplicate()
@export var sound1 : AudioStreamMP3
@export var sound2 : AudioStreamMP3
@export var sound3 : AudioStreamMP3
@export var sound4 : AudioStreamMP3
@export var sound5 : AudioStreamMP3
@export var sound6 : AudioStreamMP3
signal health_depleted

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_window().set_mouse_passthrough_polygon($Polygon2D.polygon)
	print(OS.get_cmdline_args())
	for i in OS.get_cmdline_args():
		if i.contains("debug"):
			$Time.set_visible(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		health_depleted.emit()
		pass


func _on_timer_timeout() -> void:
	var random = randi_range(1,10000)
	
	print(random)
	$Time.set_text(str(random))
	if random == 10000:
		var sfx = AudioStreamPlayer.new()
		health_depleted.emit()
		var randsound = randi_range(1,6)
		if randsound == 1:
			sfx.stream = sound1
		elif randsound == 2:
			sfx.stream = sound2
		elif randsound == 3:
			sfx.stream = sound3
		elif randsound == 4:
			sfx.stream = sound4
		elif randsound == 5:
			sfx.stream = sound5
		elif randsound == 6:
			sfx.stream = sound6
		add_child(sfx)
		sfx.play()
