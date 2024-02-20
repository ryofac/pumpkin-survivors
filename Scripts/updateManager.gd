extends Node

class_name UpdateManager

@onready var attack: Attack = get_parent() as Attack;

var index: int = 0;
var updatesList: Array[Dictionary] = [
	{"Info": "Aumentar multiplicadores", "Callable": increase_multipliers},
	{"Info": "Aumentar multiplicadores", "Callable": increase_multipliers},
	{"Info": "Diminuir cooldown", "Callable": decrease_cooldown},
	#{"Info": "Level Up", "Callables": [increase_multipliers, decrease_cooldown]},
	#{
		#"Info": "Level Up",
		#"Callables": [ 
			#{"callable": increase_multipliers, "parameters": ["bla", "bla"]},
			#{"callable": increase_multipliers, "parameters": ["bla", "bla"]}
		#]
	#},
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func decrease_cooldown(value: float):
	pass

func increase_multipliers(value: float):
	pass

func decrease_multipliers(value: float):
	pass

func levelUp():
	
	if updatesList.is_empty():
		print_rich("[color=red]UPDATE - LISTA DE UPDATES VAZIA");
		return;
	
	if index == updatesList.size():
		print_rich("[color=red]UPDATE - NENHUM UPDATE DISPONÍVEL");
		return;
	
	
	var _up = updatesList[index] as Dictionary;
	if !_up:
		print_rich("[color=red]UPDATE - NENHUM UPDATE CONFIGURADO NA LISTA");
	
	_up.Callable.call(0.5);
	
	attack.level += 1;
	index += 1;
	
	print_rich("[color=green]LEVEL UP");
	print_rich("[color=cyan]%s" % [_up.Info])
	
