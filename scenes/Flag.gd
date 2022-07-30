tool

extends Control

class_name Flag, "res://assets/tex/brazil.png"

export var country = "brazil" #setget set_country


# Called when the node enters the scene tree for the first time.
func _ready():
	update_tex()

func _process(delta):
	if Engine.editor_hint:
		update_tex()

func update_tex():
	if Global.flags.has(country):
		var path = "res://assets/tex/%s.png" % country
		$Img.texture = load(path)

func update_country(new_country):
	country = new_country
	update_tex()


func _on_Flag_gui_input(event):
	pass # Replace with function body.


func _on_ToolButton_pressed():
	var quiz = get_tree().root.get_node("QuizGame")
	quiz._on_flag_clicked(self)
