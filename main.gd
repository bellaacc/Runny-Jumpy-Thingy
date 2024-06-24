extends Node

#game variables
const DINO_START_POS := Vector2i(150, 485)
const CAM_START_POS := Vector2i(576, 324)
var score : int
var speed : float
const START_SPEED : float = 10.0
const MAX_SPEED : int = 25
var screen_size : Vector2i

#Called when the node enters scene tree for the first time.
func _ready():
	screen_size = get_window().size
	new_game()

func new_game():
	#reset variables
	score = 0
	
	#reset the nodes
	#$dino.position = DINO_START_POS
	#$dino.velocity = Vector2(0, 0)
	#$Camera2D.position = CAM_START_POS
	#$ground.position = Vector2(0, 0)

#Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta):
	speed = START_SPEED
	
	#move dino and camera
	$dino.position.x += speed
	$Camera2D.position.x += speed
	
	#update score
	score += speed
	print(score)
	
	#update ground position
	if $Camera2D.position.x - $ground.position.x > screen_size.x * 1:
		$ground.position.x += screen_size.x
	
