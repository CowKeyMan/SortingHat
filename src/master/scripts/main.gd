
extends Spatial

onready var main_menu_ui = $MainMenuUI
onready var master_ui = $MasterUI

var url = ""

func _ready():
	main_menu_ui.connect("go_pressed", self, "_switch_ui")
	master_ui.connect("back_pressed", self, "_switch_ui")
	master_ui.connect("utterred", self, "_on_utter")

func _switch_ui():
	url = main_menu_ui.get_text()
	main_menu_ui.visible = !main_menu_ui.visible
	master_ui.visible = !master_ui.visible

func _on_utter(text):
	print(text)
