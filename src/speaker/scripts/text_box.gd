extends Control

signal text_changed(text)

onready var text_edit = $TextEdit

func _ready():
	text_edit.connect("text_changed", self, "_on_TextEdit_text_changed")

func _on_TextEdit_text_changed():
	emit_signal("text_changed", text_edit.text)

func get_text():
	return text_edit.text
