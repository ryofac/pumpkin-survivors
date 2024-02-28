extends Node
class_name State
# Essa classe demonstra o comportamento de cada estado

# Sinal emitido ao transiocionar de estado: tratado na máquina de estados
signal transitioned(actualState, futureStateName);

# ready() do estado, executado uma vez assim que entra no estado
func enter():
	pass

# process() do estado
func update(delta):
	pass

# physics_process() do estado
func physicsUpdate(delta):
	pass
