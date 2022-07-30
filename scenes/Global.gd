tool

extends Node

var flags: Dictionary = {
	"argentina": {"name": "Argentina"},
	"belgium": {"name": "Bélgica"},
	"brazil": {"name": "Brasil"},
	"canada": {"name": "Canada"},
	"france": {"name": "França"},
	"germany": {"name": "Alemanha"},
	"hungary": {"name": "Hungria"},
	"israel": {"name": "Israel"},
	"italy": {"name": "Itália"},
	"japan": {"name": "Japão"},
	"lebanon": {"name": "Líbano"},
	"poland": {"name": "Polônia"},
	"southkorea": {"name": "Coréia do Sul"}
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_flag(name):
	return flags[name]
