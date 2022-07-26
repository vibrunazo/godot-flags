extends Node2D

class_name Flag, "res://tex/brazil.png"

export var country = "brazil" setget set_country


# Called when the node enters the scene tree for the first time.
func _ready():
	update_tex()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_tex():
	self.country = "germany"
	$Img.texture = load("res://tex/germany.png")
	print('updated texture')
	pass

func set_country(new_country):
	print("setted a country to ")
