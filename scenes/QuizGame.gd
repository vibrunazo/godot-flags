extends Control

class_name QuizGame

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var country = 'brazil'
export var options = ['brazil', 'canada', 'japan', 'argentina']

var el_name: Label
var el_flags: Array = options
var rng = RandomNumberGenerator.new()
var picked = 'brazil'


# Called when the node enters the scene tree for the first time.
func _ready():
	el_name = $CenterContainer/VBoxContainer/CenterContainer/VBoxContainer/LabelFlagName
	el_flags[0] = $CenterContainer/VBoxContainer/GridContainer/Flag
	el_flags[1] = $CenterContainer/VBoxContainer/GridContainer/Flag1
	el_flags[2] = $CenterContainer/VBoxContainer/GridContainer/Flag2
	el_flags[3] = $CenterContainer/VBoxContainer/GridContainer/Flag3
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func new_game():
	rng.randomize()
	options = []
	var flag_names = Global.flags.keys()
	for el in el_flags:
		var flag: Flag = el
		var flag_index = rng.randi_range(0, flag_names.size() - 1)
		var random_flag = flag_names.pop_at(flag_index)
		flag.update_country(random_flag)
		options.append(random_flag)
	
	country = pick_random_from(options)
	el_name.text = Global.flags[country].name
	$AudioFlag.stream = load("res://assets/audio/pt-br/%s.ogg" % country)
	$StartTimer.start()

func say_flag_name(name):
	$AudioFlag.stream = load("res://assets/audio/pt-br/%s.ogg" % name)
	$AudioFlag.play()

func pick_random_flag():
	var flag_names = Global.flags.keys()
	return flag_names[rng.randi_range(0, flag_names.size() - 1)]
	
func pick_random_from(array: Array):
	return array[rng.randi_range(0, array.size() - 1)]

# called by the flag, 
# who will look for a node called "QuizGame" on root when it's clicked
func _on_flag_clicked(flag: Flag):
	print("a flag was clicked with %s " % flag.country)
	picked = flag.country
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


func _on_AudioYes_finished():
	new_game()


func _on_AudioNo_finished():
	print("no finished, picked %s" % picked)
	say_flag_name(picked)
	yield($AudioFlag, "finished")
	$AudioIsNot.play()
	yield($AudioIsNot, "finished")
	say_flag_name(country)
