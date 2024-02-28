extends Node

# Essa classe é responsável pela gerência dos estados durante o game
# Ela é responsável por escutar os sinais de transição de um estado e mudar para
# o desejado
class_name StateMachine

# Estado inicial ( se houver )
@export var initialState: State

# Estado usado na process e na physic process
var currentState: State = null;

# Guarda a referência de todos os estados sendo: {"name": stateInstance}
var statesDict = {}

func _ready():
	var childrenNodes = get_children();
	if initialState:
		currentState = initialState;
		initialState.enter();
	
	# Adcionando os filhos da StateMachine (Os estados) ao dicionário de estados
	for child in childrenNodes:
		if child is State:
			statesDict["name"] = child.name.to_lower();
			child.transitioned.connect(Callable(_on_transitioned_state));
		
	
func _process(delta):
	if currentState:
		currentState.update(delta);

func _physics_process(delta):
	if currentState:
		currentState.physicsUpdate(delta);

func _on_transitioned_state(actualState: State, nextStateName: String):
	# Isso significa: estou tentando mudar de um estado que não é o meu atual
	if actualState != currentState:
		return;
	
	var _newState = statesDict.get(nextStateName.to_lower());
	
	# Verificação para caso o próximo estado não exista ou seja igual ao atual
	if !_newState or _newState == currentState:
		return;
		
	_newState.enter();
	currentState = _newState;
	
	

