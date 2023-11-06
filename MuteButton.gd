extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mute = preload("res://mute.png")
var unmute = preload("res://unmute.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_node("Singleton").muted = Singleton.muted
	if(get_parent().get_node("Singleton").muted):
		texture_normal = unmute
	else:
		texture_normal = mute


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MuteButton_pressed():
	Singleton.muted = !Singleton.muted
	get_parent().get_node("Singleton").muted = !get_parent().get_node("Singleton").muted
	if(get_parent().get_node("Singleton").muted):
		texture_normal = unmute
	else:
		texture_normal = mute
