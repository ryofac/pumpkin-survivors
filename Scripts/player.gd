extends CharacterBody2D

class_name Player

signal addedNewAttack;

var currentAttacks: Array[Node];
var dir: Vector2 = Vector2.ZERO;

func _ready():
	currentAttacks = get_node("Attacks").get_children();


func _process(delta):
	dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized();
	
	velocity = dir * 100;
	
	move_and_slide();
	
	pass

func addAttack(attackScene: PackedScene):
	var _attInstance = attackScene.instantiate() as Attack;
	
	get_node("Attacks").add_child(_attInstance);
	_attInstance.global_position = global_position;
	_attInstance.player = self;
	currentAttacks.append(_attInstance);
	addedNewAttack.emit(_attInstance);
	
