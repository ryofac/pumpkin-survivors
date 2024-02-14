extends Attack

@onready var hitbox = $Hitbox as Area2D;
@onready var animation = $AnimatedSprite2D as AnimatedSprite2D;
@onready var collision = $Hitbox/CollisionShape2D as CollisionShape2D;

var remainingCoodown: float;

func _ready():
	# Deixei os valores padrão no export
	remainingCoodown = cooldown;

func _process(delta):
	
	if remainingCoodown <= 0:
		if !animation.is_playing():
			animation.play("default");
	else:
		remainingCoodown -= delta;
		$Label.text = str(round(remainingCoodown));
		
func _on_frame_changed():
	collision.shape.radius += 6; 


func _on_animation_finished():
	collision.shape.radius = 0;
	remainingCoodown = cooldown;
