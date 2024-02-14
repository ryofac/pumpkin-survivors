extends Attack

@onready var hitbox = $Hitbox as Area2D;
@onready var animation = $AnimatedSprite2D as AnimatedSprite2D;
@onready var collision = $Hitbox/CollisionShape2D as CollisionShape2D;

func _ready():
	cooldown = 5.0;
	basicDamage = 2.0;

func _process(delta):
	cooldown -= delta;
	
	if cooldown <= 0:
		animation.play("default");
		cooldown = 5.0;



func _on_frame_changed():
	collision.shape.radius += 6; 


func _on_animation_finished():
	collision.shape.radius = 0;
	
