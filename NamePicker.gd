extends Control

var randomPerson = randi() % 7
var presentVisibility = 1
var ideaVisibility = 0
var receivers = 0
var givers = 0
var revealing = false
var presentOpening = false
var pickingGiver = true
var nameConflictPossible = false
var receiversAssigned = [false,false,false,false,false,false,false, true]
var giversAssigned = [false,false,false,false,false,false,false, true]
var giverNames = ["Kaleigh and Garrett", "Dillon and Hunter", "Heather and Joe", "Steph and Scot", "Trevor and Emily", "Craig and Claire", "Mom"]
var receiverNames = ["Kaleigh and Garrett", "Dillon and Hunter", "Heather and Joe", "Steph and Scot", "Trevor and Emily", "Craig and Claire", "Mom"]
var recentGiver
onready var lidPositionY = $Present/Lid.position.y

func _ready():
	initialize()
	
func _process(delta):
	if(Input.is_action_pressed("command") and Input.is_action_pressed("cousins")):
		go_to_cousins_scene()
		
	if(Input.is_action_just_pressed("ui_cancel")):
		get_tree().quit()
	
	if(presentOpening):
		open_present()

func initialize():
	randomize()
	$RichTextLabel.bbcode_text = "[center]Welcome to the " + str(OS.get_date().year) + " Holiday Name Picker![/center]"
	$BG/SantaSil/Sprite.global_position = Singleton.santaPosition
	$Singleton/AudioStreamPlayer.play(Singleton.musicTime)
	$MysteryIdea.text = "MYSTERY"
	$Picker.text = 'Giver'
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

func go_to_cousins_scene():
	Singleton.musicTime = $Singleton/AudioStreamPlayer.get_playback_position()
	Singleton.santaPosition = $BG/SantaSil/Sprite.global_position
	get_tree().change_scene("res://CousinPicker.tscn")

func _on_PickA_pressed():
	if(revealing == false):
		pickingGiver = !pickingGiver
		
		if(pickingGiver):
			chooseAReceiver()
		else:
			chooseAGiver()
	else:
		reveal()
			
func chooseAGiver():
	randomPerson = (randi() % 7)

	while(giversAssigned[randomPerson]):
		randomPerson = (randi() % 7)

	giversAssigned[randomPerson] = true
	recentGiver = randomPerson
	givers += 1
	giverNames.erase(nameFromNumber(randomPerson))
	
	match(recentGiver):
		0:
			$Pair1/Giver.text = nameFromNumber(randomPerson)
			$Pair1/Giver.visible = true
		1:
			$Pair2/Giver.text = nameFromNumber(randomPerson)
			$Pair2/Giver.visible = true
		2:
			$Pair3/Giver.text = nameFromNumber(randomPerson)
			$Pair3/Giver.visible = true
		3:
			$Pair4/Giver.text = nameFromNumber(randomPerson)
			$Pair4/Giver.visible = true
		4:
			$Pair5/Giver.text = nameFromNumber(randomPerson)
			$Pair5/Giver.visible = true
		5:
			$Pair6/Giver.text = nameFromNumber(randomPerson)
			$Pair6/Giver.visible = true
		6:
			$Pair7/Giver.text = nameFromNumber(randomPerson)
			$Pair7/Giver.visible = true
			
	$Picker.text = 'Receiver'
	
func chooseAReceiver():
	randomPerson = (randi() % 7)
	while(receiversAssigned[randomPerson] || randomPerson == recentGiver):
		randomPerson = (randi() % 7)
	
	# Check to make sure the last receiver won't be the same as the last giver
	if(receivers == 5):
		for i in receiverNames:
			if(i == giverNames[0]):
				nameConflictPossible = true
			else:
				if(nameConflictPossible == false):
					nameConflictPossible = false
		if(nameConflictPossible):
			while(giverNames[0] != nameFromNumber(randomPerson)):
				while(receiversAssigned[randomPerson] || randomPerson == recentGiver || nameFromNumber(randomPerson) != giverNames[0]):
					randomPerson = (randi() % 7)
	receiversAssigned[randomPerson] = true
	receiverNames.erase(nameFromNumber(randomPerson))
	receivers += 1
	match(str(recentGiver)):
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
		
	if(receivers <= 6):
		$Picker.text = 'Giver'
	else:
		$Picker.text = 'Reveal!'
		revealing = true
		
func open_present():
	if($Present/Lid.position.y > lidPositionY - 35):
		$Present/Lid.position.y -= .5

	if presentVisibility >= 0:
		$Present.modulate = Color(1,1,1,presentVisibility)
		presentVisibility -= .02
	elif(ideaVisibility <= 1):
		$MysteryIdea.modulate = Color(1,1,1,ideaVisibility)
		$MysteryIdea.visible = true
		ideaVisibility += .02
	else:
		presentOpening = false
		
func nameFromNumber(number):
	match(number):
		0:
			return "Kaleigh and Garrett"
		1:
			return "Dillon and Hunter"
		2:
			return "Heather and Joe"
		3:
			return "Steph and Scot"
		4:
			return "Trevor and Emily"
		5:
			return "Craig and Claire"
		6:
			return "Mom"
			
func reveal():
	$PickA.queue_free()
	$Picker.queue_free()
	presentOpening = true
	match(randi() % 7):
		0:
			$MysteryIdea.text = Singleton.kIdea
		1:
			$MysteryIdea.text = Singleton.dIdea
		2:
			$MysteryIdea.text = Singleton.hIdea
		3:
			$MysteryIdea.text = Singleton.sIdea
		4:
			$MysteryIdea.text = Singleton.tIdea
		5:
			$MysteryIdea.text = Singleton.cIdea
		6:
			$MysteryIdea.text = Singleton.mIdea
