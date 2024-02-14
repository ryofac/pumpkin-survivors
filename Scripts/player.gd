extends CharacterBody2D

var dir: Vector2 = Vector2.ZERO;

func _ready():
	pass


func _process(delta):
	dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized();
	
	velocity = dir * 100;
	
	move_and_slide();
	
	pass
