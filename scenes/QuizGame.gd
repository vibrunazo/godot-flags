extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var country = 'brazil'


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# called by the flag, 
# who will look for a node called "QuizGame" on root when it's clicked
func _on_flag_clicked(flag):
	print("a flag was clicked with %s " % flag.country)
	if (country == flag.country):
		print('correct flag')
	else:
		print('wrong flag')


func _on_StartTimer_timeout():
	print('start timeout')
	$AudioAsk.play()
	pass # Replace with function body.


func _on_AudioAsk_finished():
	print('ask audio over')
	$AudioFlag.play()
	pass # Replace with function body.
