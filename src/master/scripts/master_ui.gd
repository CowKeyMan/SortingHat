extends Control


signal utterred(text)
signal back_pressed

func _ready():
	_connect_to_buttons($ScrollContainer)
	$Stop.connect("utterred", self, "_on_utterance_pressed")
	$Back.connect("pressed", self, "_on_Back_pressed")

func _connect_to_buttons(parent: Node):
	if parent is BaseButton:
		parent.connect("utterred", self, "_on_utterance_pressed")
		return
	for node in parent.get_children():
		_connect_to_buttons(node)

func _on_utterance_pressed(text):
	emit_signal("utterred", text)

func _on_Back_pressed():
	emit_signal("back_pressed")
