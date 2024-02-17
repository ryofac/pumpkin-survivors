extends Node2D

@export var attackScene: PackedScene;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	
	if body is Player:
		if !attackScene:
			print_rich("[color=red]ITEM - NENHUMA CENA DE ATAQUE ADICIONADO AO ITEM");
			return
		
		body.addAttack(attackScene);
		queue_free();
