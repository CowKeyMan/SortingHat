extends Control

signal text_changed(text)

onready var text_edit = $VBoxContainer/TextEdit
onready var connected = $Connected

func _ready():
	text_edit.connect("text_changed", self, "_on_TextEdit_text_changed")

func _on_TextEdit_text_changed():
	emit_signal("text_changed", text_edit.text)

func get_text():
	return text_edit.text

func set_connected():
	connected.bbcode_text = "[center]Connected[/center]"
	connected.modulate = "23d80e"
	
func set_disconnected():
	connected.bbcode_text = "[center]Disconnected[/center]"
	connected.modulate = "d80e0e"
