extends Node
## Objeto para un salto extra
##
## Maneja las animaciones y detección de colisiones, y agrega vida al personaje principal


# Cantidad de saltos
@export var jump = 1

# Variables de animación de la poción y audio
@onready var _potion = $Potion
@onready var _effect = $Effect
@onready var _audio = $AudioStreamPlayer


# Función de inicialización
func _ready():
	_potion.play() # Iniciamos con la animación del objeto


# Detección de entrada de cuerpos al área de la poción
func _on_area_body_entered(body):
	if body.is_in_group("player"):
		# Si entra el "player", añadimos un salto
		JumpGlobal.add_jump(jump)
		_audio.play()
		_potion.visible = false
		_effect.visible = true
		# Antes de liberar memoria, hacemos un efecto de recoger la poción
		_effect.play()
		await _effect.animation_finished
		self.queue_free() # Liberamos la memoria


func _on_effect_animation_finished():
	pass # Replace with function body.
