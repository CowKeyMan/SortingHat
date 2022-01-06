extends Control

signal utterred(text)

export var utterance = ""

func _ready():
	self.connect("pressed", self, "_on_self_pressed")
	self.focus_mode = Control.FOCUS_NONE

func get_text():
	return utterance

func _on_self_pressed():
	emit_signal("utterred", self.utterance)
