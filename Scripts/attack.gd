extends Node2D

class_name Attack

@export var player: Player;
@export var level: int = 1;
@export var cooldown: float = 0.0;
@export var basicDamage: float = 0.0;
@export var multipliers: float = 1.0;

@export var updateManager: UpdateManager;

var remainingCooldown: float;

