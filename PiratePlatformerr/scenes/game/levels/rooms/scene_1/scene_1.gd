extends Node2D
## Script de escena principal.
##
## Tiene variables y funciones relacionados con la escena, por ejemplo cambios hacia otras escenas
## Cambio de escenas: https://docs.google.com/document/d/1eIBtgr8wln1pT0aZ4c-YWk_pqngyBg4HDsgdYLAXv28/edit?usp=sharing
## Uso de señales: https://docs.google.com/document/d/1vFSOuJkBy7xr5jksgCBNaTpqJHE_K87ZNafB5ZJ_I0M/edit?usp=sharing


# Area para siguiente nivel
@onready var _area_next_level = $Areas/AreaNextLevel


# Función de inicialización
func _ready():
	# Escuchamos cuando el personaje entre al área de contacto
	_area_next_level.body_entered.connect(_load_nex_level)


func _process(delta):
	mensaje()


# Cargamos el siguiente nivel (la siguiente escena)
func _load_nex_level(body):
	if body.is_in_group("player"):
		var scene = "res://scenes/game/levels/rooms/scene_2/scene_2.tscn"
		#SceneTransition.change_scene(scene) # Por el momento no usaremos este cambio de nivel

func mensaje():
	if Global.mensaje:
		$anounce.show()
	else:
		$anounce.hide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		Global.mensaje= true


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("player"):
		Global.mensaje= false
