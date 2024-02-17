extends Node2D

class_name Attack

@export var player: Player;
@export var level: int = 1;
@export var cooldown: float = 0.0;
@export var basicDamage: float = 0.0;
@export var multipliers: float = 1.0;

var remainingCooldown: float;

func increaseMultipliers(value: float):
	pass

func decreaseMultipliers(value: float):
	pass

func levelUp():
	pass
