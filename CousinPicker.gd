extends Control

var randomPerson = Singleton.cousins.size()
var revealTime = false

func _ready():
	$RichTextLabel.bbcode_text = "[center]" + str(OS.get_date().year) + " Cousin's Gift Exchange[/center]"
	
	# Initialize the Singleton
	reset()
	
	# Randomize the seed
	randomize()
	
	# Initialize Santa
	$BG/SantaSil/Sprite.global_position = Singleton.santaPosition
	
	# Start the music
	$Singleton/AudioStreamPlayer.play(Singleton.musicTime)
	
	# Initialize button text
	$Picker.text = 'Giver'
	
	# Debug info
	$Label.text = str(Singleton.passesThrough)
	
	# Let it snow
	$BG/snowing/snow1.emitting = true
	$BG/snowing/snow2.emitting = true
	$BG/Smoke.playing = true
	
	# Hide the cousins
	$Pairs/Pair1/Giver.visible = false
	$Pairs/Pair1/Receiver.visible = false
	$Pairs/Pair2/Giver.visible = false
	$Pairs/Pair2/Receiver.visible = false
	$Pairs/Pair3/Giver.visible = false
	$Pairs/Pair3/Receiver.visible = false
	$Pairs/Pair4/Giver.visible = false
	$Pairs/Pair4/Receiver.visible = false
	$Pairs/Pair5/Giver.visible = false
	$Pairs/Pair5/Receiver.visible = false
	$Pairs/Pair6/Giver.visible = false
	$Pairs/Pair6/Receiver.visible = false
	$Pairs/Pair7/Giver.visible = false
	$Pairs/Pair7/Receiver.visible = false
	$Pairs/Pair8/Giver.visible = false
	$Pairs/Pair8/Receiver.visible = false
	$Pairs/Pair9/Giver.visible = false
	$Pairs/Pair9/Receiver.visible = false
	$Pairs/Pair10/Giver.visible = false
	$Pairs/Pair10/Receiver.visible = false
	$Pairs/Pair11/Giver.visible = false
	$Pairs/Pair11/Receiver.visible = false
	$Pairs/Pair12/Giver.visible = false
	$Pairs/Pair12/Receiver.visible = false
	$Pairs/Pair13/Giver.visible = false
	$Pairs/Pair13/Receiver.visible = false
	
	# Assign cousins
	assign_cousins()
	
func _process(delta):
	if(Input.is_action_just_pressed("ui_cancel")):
		get_tree().quit()

func _on_PickA_pressed():
	reveal()

func _on_Reset_pressed():
	reset()
	get_tree().change_scene("res://CousinPicker.tscn")
			
func reveal():
	if(Singleton.pickingCousinGiver):
		chooseAGiver()
		$Picker.text = "Receiver"
	else:
		chooseAReceiver()
		$Picker.text = "Giver"
	
	Singleton.pickingCousinGiver = !Singleton.pickingCousinGiver
	
func chooseAGiver():
	randomPerson = (randi() % Singleton.cousins.size())
	while(Singleton.cousinGiversAssigned[randomPerson]):
		randomPerson = (randi() % Singleton.cousins.size())
	Singleton.cousinGiversAssigned[randomPerson] = true
	Singleton.recentCousinGiver = randomPerson
	Singleton.cousinGivers += 1
	
	match(str(Singleton.recentCousinGiver)):
		'0':
			$Pairs/Pair1/Giver.visible = true
		'1':
			$Pairs/Pair2/Giver.visible = true
		'2':
			$Pairs/Pair3/Giver.visible = true
		'3':
			$Pairs/Pair4/Giver.visible = true
		'4':
			$Pairs/Pair5/Giver.visible = true
		'5':
			$Pairs/Pair6/Giver.visible = true
		'6':
			$Pairs/Pair7/Giver.visible = true
		'7':
			$Pairs/Pair8/Giver.visible = true
		'8':
			$Pairs/Pair9/Giver.visible = true
		'9':
			$Pairs/Pair10/Giver.visible = true
		'10':
			$Pairs/Pair11/Giver.visible = true
		'11':
			$Pairs/Pair12/Giver.visible = true
		'12':
			$Pairs/Pair13/Giver.visible = true
	$Picker.text = 'Receiver'
	
func chooseAReceiver():
	randomPerson = (randi() %Singleton.cousins.size())

	while(Singleton.cousinReceiversAssigned[randomPerson] && randomPerson == Singleton.recentCousinGiver):
		randomPerson = (randi() % Singleton.cousins.size())
		
	Singleton.cousinReceiversAssigned[randomPerson] = true
	Singleton.cousinReceivers += 1
	
	if(Singleton.cousinReceivers == Singleton.cousins.size()):
		$PickA.queue_free()
		$Picker.queue_free()

	match(str(Singleton.recentCousinGiver)):
		'0':
#			$Pairs/Pair1/Receiver.text = nameFromNumber(randomPerson)
			$Pairs/Pair1/Receiver.visible = true
		'1':
#			$Pairs/Pair2/Receiver.text = nameFromNumber(randomPerson)
			$Pairs/Pair2/Receiver.visible = true
		'2':
#			$Pairs/Pair3/Receiver.text = nameFromNumber(randomPerson)
			$Pairs/Pair3/Receiver.visible = true
		'3':
#			$Pairs/Pair4/Receiver.text = nameFromNumber(randomPerson)
			$Pairs/Pair4/Receiver.visible = true
		'4':
#			$Pairs/Pair5/Receiver.text = nameFromNumber(randomPerson)
			$Pairs/Pair5/Receiver.visible = true
		'5':
#			$Pairs/Pair6/Receiver.text = nameFromNumber(randomPerson)
			$Pairs/Pair6/Receiver.visible = true
		'6':
#			$Pairs/Pair7/Receiver.text = nameFromNumber(randomPerson)
			$Pairs/Pair7/Receiver.visible = true
		'7':
#			$Pairs/Pair8/Receiver.text = nameFromNumber(randomPerson)
			$Pairs/Pair8/Receiver.visible = true
		'8':
#			$Pairs/Pair9/Receiver.text = nameFromNumber(randomPerson)
			$Pairs/Pair9/Receiver.visible = true
		'9':
#			$Pairs/Pair10/Receiver.text = nameFromNumber(randomPerson)
			$Pairs/Pair10/Receiver.visible = true
		'10':
#			$Pairs/Pair11/Receiver.text = nameFromNumber(randomPerson)
			$Pairs/Pair11/Receiver.visible = true
		'11':
#			$Pairs/Pair12/Receiver.text = nameFromNumber(randomPerson)
			$Pairs/Pair12/Receiver.visible = true
		'12':
#			$Pairs/Pair13/Receiver.text = nameFromNumber(randomPerson)
			$Pairs/Pair13/Receiver.visible = true


func assign_cousins():
	var cousinMapping = {}
	var siblingsDetected = true
	
	# Scramble cousins until nobody is giving to a sibling
	while siblingsDetected:
		var index = 0
		Singleton.cousins.shuffle()
		siblingsDetected = false
		
		# Map Receivers to their givers
		for cousin in Singleton.cousins:
			cousinMapping[nameFromNumber(index)] = cousin
			index += 1
			
		# Check for siblings between givers and receivers
		for giver in cousinMapping.keys():
			var receiver = cousinMapping[giver]
			
			if((Singleton.kFamily.has(giver)) and (Singleton.kFamily.has(receiver))):
				siblingsDetected = true

			if(Singleton.dFamily.has(giver) and Singleton.dFamily.has(receiver)):
				siblingsDetected = true

			if(Singleton.hFamily.has(giver) and Singleton.hFamily.has(receiver)):
				siblingsDetected = true

			if(Singleton.sFamily.has(giver) and Singleton.sFamily.has(receiver)):
				siblingsDetected = true

			if(Singleton.tFamily.has(giver) and Singleton.tFamily.has(receiver)):
				siblingsDetected = true

			if(Singleton.cFamily.has(giver) and Singleton.cFamily.has(receiver)):
				siblingsDetected = true


		index = 1
		var root_node = get_node("Pairs")
		
		for giver in cousinMapping.keys():
			var receiver = cousinMapping[giver]
			var path = "Pair" + str(index) + "/Receiver"
			var target_node = root_node.get_node(path)
			target_node.text = receiver
			index += 1
	
func reset():
	Singleton.pickingCousinGiver = true
	Singleton.recentCousinGiver = 99
	Singleton.cousinGiversAssigned = [false,false,false,false,false,false,false,false,false,false,false,false,false, true]
	Singleton.cousinReceiversAssigned = [false,false,false,false,false,false,false,false,false,false,false,false,false, true]
	
func nameFromNumber(number):
	match(str(number)):
		'0':
			return "Ethan"
		'1':
			return "Cora"
		'2':
			return "Haven"
		'3':
			return "Cayden"
		'4':
			return "Ella Joy"
		'5':
			return "Jillyan"
		'6':
			return "Benjamin"
		'7':
			return "Gracelyn"
		'8':
			return "Emberlyn"
		'9':
			return "Ella Rose"
		'10':
			return "Anya"
		'11':
			return "Arabelle"
		'12':
			return "Hudson"
