extends Node2D

var max_snow = 300
var snow_increase = 5
export var blizzard_time = 420
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(5)
	$BlizzardTimer.start(blizzard_time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	$Timer2.start(3)
	$snow3.amount = 50


func _on_Timer2_timeout():
	$snow2.amount = 1


func _on_BlizzardTimer_timeout():
	$snow2.amount = 9999
