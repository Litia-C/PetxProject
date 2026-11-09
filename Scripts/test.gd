
extends Node2D
@onready var character = %char
@onready var dialog_ui = %dialogo_box

var dialog_index: int = 0

# Línea de diálogo que se mostrará en pantall
const dialog_lines : Array[String] = [
	"Miko: [wave]Hola...[/wave]",
	"Miko: [matrix]No pienso decir 'homiko'[/matrix]",
	"Miko: Gilipollas",
	"Miko: Pero...",
	"Miko: Espero que disfrutes la demo"
]

func _ready() -> void:
	dialog_index = 0
	process_line()

func  _input(event: InputEvent) -> void:
	if event.is_action_pressed("next_line"):
		if dialog_index < len(dialog_lines) - 1:
			dialog_index += 1
			process_line()

func parse_line(line: String):
	var line_info = line.split(": ")
	assert(len(line_info) >= 2)
	return{
		"texto": line_info[0] + "\n" + line_info[1]
	}

func process_line():
	var line = dialog_lines[dialog_index]
	var line_info = parse_line(line)
	dialog_ui.texto.text = line_info["texto"]
