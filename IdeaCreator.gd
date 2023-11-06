extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var beam = preload("res://cursor.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(beam, Input.CURSOR_IBEAM)
#	$BG/snowing/snow1.emitting = true
#	$BG/snowing/snow2.emitting = true
	$BG/Smoke.playing = true
	$Singleton/AudioStreamPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
	Singleton.musicTime = $Singleton/AudioStreamPlayer.get_playback_position()
	Singleton.santaPosition = $BG/SantaSil/Sprite.global_position
	get_tree().change_scene("res://NamePicker.tscn")
