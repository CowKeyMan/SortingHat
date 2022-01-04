extends Control

signal text_changed(text)
signal go_pressed

onready var text_edit = $VBoxContainer/TextEdit
onready var go = $Go

func _ready():
	text_edit.connect("text_changed", self, "_on_TextEdit_text_changed")
	go.connect("pressed", self, "_on_Go_pressed")
	
func _on_TextEdit_text_changed():
	emit_signal("text_changed", text_edit.text)

func get_text():
	return text_edit.text

func _on_Go_pressed():
	emit_signal("go_pressed")
