extends Node2D

var moveRate = 1.2
var startingPosition
var pointingUp = true
var timerStarted = false
var moving = false

func _ready():
	startingPosition = $Sprite.position.x
	$startingTimer.start(3)

func _process(delta):
	if(Singleton.santaMoving):
		$Sprite.position.x -= moveRate
			
		if($Sprite.position.x <= $Position2D.position.x && timerStarted == false):
			timerStarted = true
			$Timer.start((randi() % 10) + 11)
			
	if(Singleton.muted):
		$HoHoHo.volume_db = -80
	else:
		$HoHoHo.volume_db = -25.616
			
func HoHoHo():
	$HoHoHo.play()
	$NoNoNoTimer.start(7)

func _on_Timer_timeout():
	$Sprite.position.x = startingPosition
	timerStarted = false
	$HoHoHoTimer.start(3)	

func _on_startingTimer_timeout():
	Singleton.santaMoving = true
	$HoHoHoTimer.start(3)

func _on_HoHoHoTimer_timeout():
	HoHoHo()

func _on_NoNoNoTimer_timeout():
	$HoHoHo.stop()
