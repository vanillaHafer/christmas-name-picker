extends Node2D

var currentDistance = 0
var totalDistance = 100
var moveRate = 1.2
var movingLeft = true
var startingPosition
var pointingUp = true
var timerStarted = false
var moving = false

# Called when the node enters the scene tree for the first time.
func _ready():
	startingPosition = $Sprite.position.x
	$startingTimer.start(3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if(Singleton.santaMoving):
		if(currentDistance % 70 == 0):
			pass
	#		if(pointingUp):
	#			$Sprite.rotation_degrees = -11.5
	#		else:
	#			$Sprite.rotation_degrees = 11.5
	#		pointingUp = !pointingUp
			
		
		if(movingLeft):
			$Sprite.position.x -= moveRate
		else:
			$Sprite.position.x += moveRate
			
		currentDistance += 1
		if($Sprite.position.x <= $Position2D.position.x && timerStarted == false):
			timerStarted = true
			$Timer.start((randi() % 10) + 11)
			
func HoHoHo():
	$HoHoHo.play()
	$NoNoNoTimer.start(7)

func _on_Timer_timeout():
	$Sprite.position.x = startingPosition
	currentDistance = 0
	timerStarted = false
	$HoHoHoTimer.start(3)
	

func _on_startingTimer_timeout():
	Singleton.santaMoving = true
	$HoHoHoTimer.start(3)

func _on_HoHoHoTimer_timeout():
	HoHoHo()

func _on_NoNoNoTimer_timeout():
	$HoHoHo.stop()
