extends Control

class_name QuizGame

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var country = 'brazil'

var el_name: Label


# Called when the node enters the scene tree for the first time.
func _ready():
	el_name = $CenterContainer/VBoxContainer/CenterContainer/VBoxContainer/LabelFlagName
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func new_game():
	country = 'germany'
	el_name.text = country
	$AudioFlag.stream = load("res://assets/audio/pt-br/germany.ogg")

# called by the flag, 
# who will look for a node called "QuizGame" on root when it's clicked
func _on_flag_clicked(flag: Flag):
	print("a flag was clicked with %s " % flag.country)
	if (country == flag.country):
		print('correct flag')
		$AudioYes.play()
	else:
		print('wrong flag')
		$AudioNo.play()


func _on_StartTimer_timeout():
	print('start timeout')
	$AudioAsk.play()


func _on_AudioAsk_finished():
	print('ask audio over')
	$AudioFlag.play()
