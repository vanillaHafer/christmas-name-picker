extends Node

var giversAssigned    = [false,false,false,false,false,false, true]
var receiversAssigned = [false,false,false,false,false,false, true]

var pickingGiver = true
var givers    = 0
var receivers = 0
var recentGiver
var musicTime
var santaPosition
var santaMoving = false
var muted = false

var giverNames    = ["Kaleigh and Garrett", "Dillon and Hunter", "Heather and Joe", "Steph and Scot", "Trevor and Emily", "Craig and Claire"]
var receiverNames = ["Kaleigh and Garrett", "Dillon and Hunter", "Heather and Joe", "Steph and Scot", "Trevor and Emily", "Craig and Claire"]

var nameConflictPossible = false

var passesThrough = 0

var kIdea = ""
var dIdea = ""
var hIdea = ""
var sIdea = ""
var tIdea = ""
var cIdea = ""

func _process(delta):
	if(muted):
		$AudioStreamPlayer.volume_db = -80
	else:
		$AudioStreamPlayer.volume_db = 0

func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()
