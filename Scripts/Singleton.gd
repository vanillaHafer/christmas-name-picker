extends Node

var musicTime
var santaPosition
var santaMoving = false
var muted = false

var passesThrough = 0

var kIdea = ""
var dIdea = ""
var hIdea = ""
var sIdea = ""
var tIdea = ""
var cIdea = ""
var mIdea = ""

###########
# Cousins #
###########

var kFamily = ["Ethan", "Cora", "Haven"]
var dFamily = ["Cayden", "Ella Joy"]
var hFamily = ["Jillyan"]
var sFamily = ["Benjamin", "Gracelyn", "Emberlyn"]
var tFamily = ["Ella Rose", "Anya", "Arabelle"]
var cFamily = ["Hudson"]
var cousins = []

var recentCousinGiver
var pickingCousinGiver
var cousinGiversAssigned    = [false,false,false,false,false,false,false,false,false,false,false,false,false, true]
var cousinReceiversAssigned = [false,false,false,false,false,false,false,false,false,false,false,false,false, true]
var cousinGivers = 0
var cousinReceivers = 0

func _ready():
	cousins += kFamily
	cousins += dFamily
	cousins += hFamily
	cousins += sFamily
	cousins += tFamily
	cousins += cFamily

func _process(delta):
	if(muted):
		$AudioStreamPlayer.volume_db = -80
	else:
		$AudioStreamPlayer.volume_db = 0

func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()
