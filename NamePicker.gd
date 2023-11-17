extends Control

var randomPerson = 7
var revealTime = false
var mysteryVisible = false
var presentOpening = false
var presentDisappearing = false
var presentVisibility = 1
var ideaVisibility   = 0
var chicken = true
onready var lidPositionY = $Present/Lid.position.y

func _ready():
	randomize()
	$RichTextLabel.text = "Welcome to the " + str(OS.get_date().year) + " Holiday Name Picker!"
	$BG/SantaSil/Sprite.global_position = Singleton.santaPosition
	$Singleton/AudioStreamPlayer.play(Singleton.musicTime)
	$MysteryIdea.text = "MYSTERY"
	$Picker.text = 'Giver'
	$Label.text = str(Singleton.passesThrough)
	$BG/snowing/snow1.emitting = true
	$BG/snowing/snow2.emitting = true
	$BG/Smoke.playing = true
	
	$Pair1/Giver.visible = false
	$Pair1/Receiver.visible = false
	$Pair2/Giver.visible = false
	$Pair2/Receiver.visible = false
	$Pair3/Giver.visible = false
	$Pair3/Receiver.visible = false
	$Pair4/Giver.visible = false
	$Pair4/Receiver.visible = false
	$Pair5/Giver.visible = false
	$Pair5/Receiver.visible = false
	$Pair6/Giver.visible = false
	$Pair6/Receiver.visible = false
	$Pair7/Giver.visible = false
	$Pair7/Receiver.visible = false
	
func _process(delta):
	if(Input.is_action_pressed("command") and Input.is_action_pressed("cousins")):
		Singleton.musicTime = $Singleton/AudioStreamPlayer.get_playback_position()
		Singleton.santaPosition = $BG/SantaSil/Sprite.global_position
		get_tree().change_scene("res://CousinPicker.tscn")
		
	if(Input.is_action_just_pressed("ui_cancel")):
		get_tree().quit()
	
	if(presentOpening):
		presentDisappearing = true
		if($Present/Lid.position.y > lidPositionY - 35):
			$Present/Lid.position.y -= .5
		else:
			presentOpening = false
			$PresentTimer.start(.3)
	if(presentDisappearing):
		$Present.modulate = Color(1,1,1,presentVisibility)
		presentVisibility -= .02
		if presentVisibility <= 0 && chicken:
			chicken = false
			mysteryVisible = true
			$MysteryIdea.modulate = Color(1,1,1,ideaVisibility)
			$MysteryIdea.visible = true
			
	if(mysteryVisible):
		$MysteryIdea.modulate = Color(1,1,1,ideaVisibility)
		ideaVisibility += .02
		if(ideaVisibility >= 1):
			mysteryVisible = false
		

func _on_PickA_pressed():
	
	if(revealTime == false):
		Singleton.pickingGiver = !Singleton.pickingGiver
		
		if(Singleton.pickingGiver):
			chooseAReceiver()
		else:
			chooseAGiver()
	else:
		reveal()
			
func chooseAGiver():
	randomPerson = (randi() % 7)
	while(Singleton.giversAssigned[randomPerson]):
		randomPerson = (randi() % 7)
	Singleton.giversAssigned[randomPerson] = true
	Singleton.recentGiver = randomPerson
	Singleton.givers += 1
	Singleton.giverNames.erase(nameFromNumber(randomPerson))
	
	match(str(Singleton.recentGiver)):
		'0':
			$Pair1/Giver.text = nameFromNumber(randomPerson)
			$Pair1/Giver.visible = true
		'1':
			$Pair2/Giver.text = nameFromNumber(randomPerson)
			$Pair2/Giver.visible = true
		'2':
			$Pair3/Giver.text = nameFromNumber(randomPerson)
			$Pair3/Giver.visible = true
		'3':
			$Pair4/Giver.text = nameFromNumber(randomPerson)
			$Pair4/Giver.visible = true
		'4':
			$Pair5/Giver.text = nameFromNumber(randomPerson)
			$Pair5/Giver.visible = true
		'5':
			$Pair6/Giver.text = nameFromNumber(randomPerson)
			$Pair6/Giver.visible = true
		'6':
			$Pair7/Giver.text = nameFromNumber(randomPerson)
			$Pair7/Giver.visible = true
			
	$Picker.text = 'Receiver'
	
func chooseAReceiver():
	randomPerson = (randi() % 7)
	while(Singleton.receiversAssigned[randomPerson] || randomPerson == Singleton.recentGiver):
		randomPerson = (randi() % 7)
	
	# Check to make sure the last receiver won't be the same as the last giver
	if(Singleton.receivers == 5):
		for i in Singleton.receiverNames:
			if(i == Singleton.giverNames[0]):
				Singleton.nameConflictPossible = true
			else:
				if(Singleton.nameConflictPossible == false):
					Singleton.nameConflictPossible = false
		if(Singleton.nameConflictPossible):
			while(Singleton.giverNames[0] != nameFromNumber(randomPerson)):
				while(Singleton.receiversAssigned[randomPerson] || randomPerson == Singleton.recentGiver || nameFromNumber(randomPerson) != Singleton.giverNames[0]):
					randomPerson = (randi() % 7)
	Singleton.receiversAssigned[randomPerson] = true
	Singleton.receiverNames.erase(nameFromNumber(randomPerson))
	Singleton.receivers += 1
	match(str(Singleton.recentGiver)):
		'0':
			$Pair1/Receiver.text = nameFromNumber(randomPerson)
			$Pair1/Receiver.visible = true
		'1':
			$Pair2/Receiver.text = nameFromNumber(randomPerson)
			$Pair2/Receiver.visible = true
		'2':
			$Pair3/Receiver.text = nameFromNumber(randomPerson)
			$Pair3/Receiver.visible = true
		'3':
			$Pair4/Receiver.text = nameFromNumber(randomPerson)
			$Pair4/Receiver.visible = true
		'4':
			$Pair5/Receiver.text = nameFromNumber(randomPerson)
			$Pair5/Receiver.visible = true
		'5':
			$Pair6/Receiver.text = nameFromNumber(randomPerson)
			$Pair6/Receiver.visible = true
		'6':
			$Pair7/Receiver.text = nameFromNumber(randomPerson)
			$Pair7/Receiver.visible = true
		
	if(Singleton.receivers <= 6):
		$Picker.text = 'Giver'
	else:
		$Picker.text = 'Reveal!'
		revealTime = true
		#$PickA.disabled = true
		
func nameFromNumber(number):
	match(str(number)):
		'0':
			return "Kaleigh and Garrett"
		'1':
			return "Dillon and Hunter"
		'2':
			return "Heather and Joe"
		'3':
			return "Steph and Scot"
		'4':
			return "Trevor and Emily"
		'5':
			return "Craig and Claire"
		'6':
			return "Mom"

func _on_Reset_pressed():
	Singleton.giversAssigned    = [false,false,false,false,false,false,false, true]
	Singleton.receiversAssigned = [false,false,false,false,false,false,false, true]
	Singleton.pickingGiver = true
	Singleton.givers = 0
	Singleton.receivers = 0
	Singleton.recentGiver = 99
	Singleton.giverNames    = ["Kaleigh and Garrett", "Dillon and Hunter", "Heather and Joe", "Steph and Scot", "Trevor and Emily", "Craig and Claire", "Mom"]
	Singleton.receiverNames = ["Kaleigh and Garrett", "Dillon and Hunter", "Heather and Joe", "Steph and Scot", "Trevor and Emily", "Craig and Claire", "Mom"]
	Singleton.nameConflictPossible = false
	Singleton.passesThrough += 1
	get_tree().change_scene("res://NamePicker.tscn")

func _on_Reveal_pressed():
	reveal()
			
func reveal():
	$PickA.queue_free()
	$Picker.queue_free()
	presentOpening = true
	match(str(randi() % 7)):
		'0':
			$MysteryIdea.text = Singleton.kIdea
		'1':
			$MysteryIdea.text = Singleton.dIdea
		'2':
			$MysteryIdea.text = Singleton.hIdea
		'3':
			$MysteryIdea.text = Singleton.sIdea
		'4':
			$MysteryIdea.text = Singleton.tIdea
		'5':
			$MysteryIdea.text = Singleton.cIdea
		'6':
			$MysteryIdea.text = Singleton.mIdea

func _on_IdeaTimer_timeout():
	$MysteryIdea.secret = false
	mysteryVisible = true

func _on_PresentTimer_timeout():
	presentDisappearing = true
