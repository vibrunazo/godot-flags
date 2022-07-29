tool

extends Control

class_name Flag, "res://tex/brazil.png"

export var country = "brazil" #setget set_country


# Called when the node enters the scene tree for the first time.
func _ready():
	update_tex()

func _process(delta):
	if Engine.editor_hint:
		update_tex()

func update_tex():
	if Global.flags.has(country):
		var path = "res://tex/%s.png" % country
		$Img.texture = load(path)
