extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mute = preload("res://mute.png")
var unmute = preload("res://unmute.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	var singleton = get_parent().get_parent().get_node("Singleton")
	singleton.muted = Singleton.muted

	if(singleton.muted):
		texture_normal = unmute
	else:
		texture_normal = mute

func _on_MuteButton_pressed():
	var singleton = get_parent().get_parent().get_node("Singleton")

	Singleton.muted = !Singleton.muted
	singleton.muted = !singleton.muted

	if(singleton.muted):
		texture_normal = unmute
	else:
		texture_normal = mute
