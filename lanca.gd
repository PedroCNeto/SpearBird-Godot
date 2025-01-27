extends Area2D
signal activeSpear
var speed = 400
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * speed * delta




func _on_body_entered(body):
	if body is RigidBody2D and visible == true:
		Points.points+=5
		body.queue_free()
		hide()
		activeSpear.emit()

func _on_visible_on_screen_notifier_2d_screen_exited():
	hide()
	activeSpear.emit()

func _on_visible_on_screen_notifier_2d_screen_entered():
	look_at(get_global_mouse_position())
