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
	$AmbientSound.play()
	_area_next_level.body_entered.connect(_load_nex_level)
	$Fight.stop()

func _process(delta):
	mensaje()
	showportal()
	#if !$Fight.is_playing() and Global.mensaje:
		#$Fight.play()


# Cargamos el siguiente nivel (la siguiente escena)
func _load_nex_level(body):
	if body.is_in_group("player") and !Global.showportal:
		var scene = "res://scenes/game/levels/rooms/scene_2/scene_2.tscn"
		#SceneTransition.change_scene(scene) # Por el momento no usaremos este cambio de nivel

func mensaje():
	if Global.mensaje:
		$anounce.show()
	else:
		$anounce.hide()

func showportal():
	if Global.showportal:
		$Objects/DoorChangeScene.show()
		$Objects/DoorChangeScene/CollisionShape2D.disabled = false
	#else:
		#$Objects/DoorChangeScene.hide()


func _on_area_2d_body_entered(body):            #collisionshape red
	if body.is_in_group("player"):
		Global.mensaje = true
		Global.firstTime = true

		$Fight.play() #reproducir musica al entrar
		$Fight.seek(9.0)
		$AmbientSound.stop() #para musica ambiental al entrar
		call_deferred("arenaJefe")
		call_deferred("desactivarArea")
	#elif !Global.showportal:

	
func _on_area_2d_2_body_entered(body):           #collisionshape skyblue
	if body.is_in_group("player"):
		Global.mensaje = false
		if Global.firstTime:
			Global.showportal = true

#func _on_area_2d_body_exited(body):
	#if body.is_in_group("player"):
		#$Area2D/Fight.stop() #parar musica al salir
		#$AmbientSound.play() #reproducir musica ambiental al salir
	
#func door():
	#$Objects/DoorChangeScene/CollisionShape2D.disabled = false
	
func arenaJefe():
	$StaticBody2D/CollisionShape2D.disabled = false

func desactivarArea():
	$Area2D/ver_mensaje.disabled = true




#extends Node2D
### Script de escena principal.
###
### Tiene variables y funciones relacionados con la escena, por ejemplo cambios hacia otras escenas
### Cambio de escenas: https://docs.google.com/document/d/1eIBtgr8wln1pT0aZ4c-YWk_pqngyBg4HDsgdYLAXv28/edit?usp=sharing
### Uso de señales: https://docs.google.com/document/d/1vFSOuJkBy7xr5jksgCBNaTpqJHE_K87ZNafB5ZJ_I0M/edit?usp=sharing
#
#
## Area para siguiente nivel
#@onready var _area_next_level = $Areas/AreaNextLevel
#
#
#
## Función de inicialización
#func _ready():
	## Escuchamos cuando el personaje entre al área de contacto
	#_area_next_level.body_entered.connect(_load_nex_level)
#
#
#func _process(delta):
	#mensaje()
	##showportal()
#
## Cargamos el siguiente nivel (la siguiente escena)
#func _load_nex_level(body):
	#if body.is_in_group("player") and !Global.showportal:
		#var scene = "res://scenes/game/levels/rooms/scene_2/scene_2.tscn"
		##SceneTransition.change_scene(scene) # Por el momento no usaremos este cambio de nivel
#
#func mensaje():
	#if Global.mensaje:
		#$anounce.show()
	#else:
		#$anounce.hide()
#
#func showportal():
	#if Global.showportal:
		#$Objects/DoorChangeScene.show()
	#else:
		#$Objects/DoorChangeScene.hide()
#
#
#func _on_area_2d_body_entered(body):            #collisionshape red
	#if body.is_in_group("player"):
		#Global.mensaje= true
		#Global.showportal = true
		#$Fight.play() #reproducir musica al entrar
		#$AmbientSound.stop() #para musica ambiental al entrar
	##elif !Global.showportal:
		#call_deferred("door")
	#
#func _on_area_2d_2_body_entered(body):           #collisionshape skyblue
	#if body.is_in_group("player"):
		#Global.mensaje= false
		#if Global.showportal:
			#$Objects/DoorChangeScene.show()
#
#func _on_area_2d_body_exited(body):
	#if body.is_in_group("player"):
		#$Fight.stop() #parar musica al salir
		#$AmbientSound.play() #reproducir musica ambiental al salir
	#
#func door():
	#$Objects/DoorChangeScene/CollisionShape2D.disabled = false
	#
