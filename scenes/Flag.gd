tool

extends Control

class_name Flag, "res://tex/brazil.png"

export var country = "brazil" #setget set_country


# Called when the node enters the scene tree for the first time.
func _ready():
	update_tex()

func _process(delta):
	if Engine.editor_hint:
		# Code to execute in editor.
#		print("flag in editor, country is {country}".format({"country": country}))
		if country == "brazil":
			$Img.texture = load("res://tex/brazil.png")
		if country == "japan":
			$Img.texture = load("res://tex/japan.png")

	if not Engine.editor_hint:
		# Code to execute in game.
		pass

func update_tex():
	self.country = "germany"
	$Img.texture = load("res://tex/germany.png")
	print('updated texture')
	pass

func set_country(new_country):
	print("setted a country to ")
