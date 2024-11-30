extends Node

var gravity = 10

var speed:int
var life:int = 2

var body:Node2D
var izquierda:bool = true
#var inarea: bool = true
var indmg:bool = false

var posInicial: Vector2 


# Called when the node enters the scene tree for the first time.
func _ready():
	$movility.play("Walk")
	posInicial.x = position.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if life ==0:
		$movility.play("DEAD")
		speed = 0

func _physics_process(delta):
	velocity.y += gravity
