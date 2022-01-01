extends Button


func _ready():
	self.connect("pressed", self, "_on_self_pressed")
	
func _on_self_pressed():
	get_tree().quit()
