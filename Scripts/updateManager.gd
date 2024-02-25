extends Node

class_name UpdateManager

@onready var attack: Attack = get_parent() as Attack;

var index: int = 0;
var updatesList: Array[Dictionary] = [
	#{"Info": "Aumentar multiplicadores", "Callable": increase_multipliers},
	#{"Info": "Aumentar multiplicadores", "Callable": increase_multipliers},
	#{"Info": "Diminuir cooldown", "Callable": decrease_cooldown},
	#{"Info": "Level Up", "Callables": [increase_multipliers, decrease_cooldown]},
	{
		"Info": "[color=green]+50%[/color] multiplicadores \n[color=green]-20%[/color] cooldown ",
		"Callables": [ 
			{"callable": increase_multipliers, "param": 0.5},
			{"callable": decrease_cooldown, "param": 0.2}
		]
	},
	{
		"Info": "[color=green]+100%[/color] multiplicadores \n[color=green]-50%[/color] cooldown ",
		"Callables": [ 
			{"callable": increase_multipliers, "param": 1.},
			{"callable": decrease_cooldown, "param": 0.5}
		]
	},
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func decrease_cooldown(value: float):
	attack.cooldown *= 1 - value; 

func increase_multipliers(value: float):
	attack.multipliers *= 1 + value;
	pass

func decrease_multipliers(value: float):
	attack.multipliers *= 1 - value;
	pass

func levelUp():
	
	if updatesList.is_empty():
		print_rich("[color=red]UPDATE - LISTA DE UPDATES VAZIA");
		return;
	
	if index == updatesList.size():
		print_rich("[color=red]UPDATE - NENHUM UPDATE DISPONÍVEL");
		return;
	
	
	var _up = updatesList[index] as Dictionary;
	
	for function in _up.Callables:
		
		if function.has("param"): 
			function.callable.call(function.param);
		else: 
			function.callable.call();
	
	attack.level += 1;
	index += 1;
	
	print_rich("[color=green]LEVEL UP");
	print_rich("[color=cyan]%s" % [_up.Info])
	
