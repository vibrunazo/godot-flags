tool

extends Node

var flags: Dictionary = {
	"brazil": {"name": "Brasil"},
	"canada": {"name": "Canada"},
	"germany": {"name": "Alemanha"},
	"japan": {"name": "Japão"}
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_flag(name):
	return flags[name]
