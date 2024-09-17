extends Control

var beam = preload("res://Assets/Images/cursor.png")

func _ready():
	Input.set_custom_mouse_cursor(beam, Input.CURSOR_IBEAM)
	$BG/Smoke.playing = true
	$Singleton/AudioStreamPlayer.play()
	$Kaleigh/TextEdit.grab_focus()

func _process(delta):
	if(Input.is_action_just_pressed("ui_cancel")):
		get_tree().quit()

func _on_Button_pressed():
	Singleton.kIdea = $Kaleigh/TextEdit.text
	Singleton.dIdea = $Dillon/TextEdit.text
	Singleton.hIdea = $Heather/TextEdit.text
	Singleton.sIdea = $Stephanie/TextEdit.text
	Singleton.tIdea = $Trevor/TextEdit.text
	Singleton.cIdea = $Craig/TextEdit.text
	Singleton.mIdea = $Mom/TextEdit.text
	Singleton.musicTime = $Singleton/AudioStreamPlayer.get_playback_position()
	Singleton.santaPosition = $BG/SantaSil/Sprite.global_position
	get_tree().change_scene("res://NamePicker.tscn")

