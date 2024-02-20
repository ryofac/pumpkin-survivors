extends Node2D

@onready var playerScene = preload("res://Scenes/player.tscn");

var initialPos: Vector2 = Vector2(100, 100);
var player: Player;
var labels: Array[Label];

func _ready():
	instantiate_player();
	player.addedNewAttack.connect(_on_added_attack)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_labels();
	pass

func instantiate_player():
	player = playerScene.instantiate() as Player;
	
	if !player:
		print_rich("[color=red]LEVEL - PROBLEMA COM A CENA DO PLAYER");
		return
		
	add_child(player);
	player.global_position = initialPos;

func draw_label(attack: Attack):
	
	#if labels.size() != 0:
		#labels.clear();
		#get_node("UI/VBoxContainer").add_child()
	
	if !player:
		print_rich("\n[color=red]LEVEL - TENTANDO MONTAR AS LABELS MAS O PLAYER ESTÁ NULO");
		return
		
	#for attack in player.currentAttacks:
		#var _newLabel = Label.new() as Label;
		#get_node("UI/VBoxContainer").add_child(_newLabel);
		#labels.append(_newLabel);
		
	if attack:
		var _newLabel = Label.new() as Label;
		get_node("UI/VBoxContainer").add_child(_newLabel);
		labels.append(_newLabel);

func update_labels(): 
	var _attacks = player.currentAttacks;
	
	for i in range(_attacks.size()):
		labels[i].text = " " + str(round(_attacks[i].remainingCooldown));

func _on_added_attack(newAttack: Attack):
	draw_label(newAttack);


func _on_button_pressed():
	var _att = player.currentAttacks.pick_random() as Attack;
	if !_att:
		print_rich("\n[color=red]LEVEL - NENHUM ATAQUE ENCONTRADO");
		return;
		
	_att.updateManager.levelUp();
	
