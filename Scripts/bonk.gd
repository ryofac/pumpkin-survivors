extends Attack

@onready var hitbox = $Hitbox as Area2D;
@onready var animation = $AnimatedSprite2D as AnimatedSprite2D;
@onready var collision = $Hitbox/CollisionShape2D as CollisionShape2D;

func _ready():
	# Deixei os valores padrão no export
	remainingCooldown = cooldown;

func _process(delta):
	
	#if player:
		#global_position = player.global_position;
	
	if remainingCooldown <= 0:
		if !animation.is_playing():
			animation.play("default");
	else:
		remainingCooldown -= delta;
		
func _on_frame_changed():
	collision.shape.radius += 5; 


func _on_animation_finished():
	collision.shape.radius = 0;
	remainingCooldown = cooldown;
