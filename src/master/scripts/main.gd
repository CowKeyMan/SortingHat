
extends Spatial

onready var main_menu_ui = $MainMenuUI
onready var master_ui = $MasterUI
onready var http_request = $HTTPRequest

var url = ""

func _ready():
	main_menu_ui.connect("go_pressed", self, "_switch_ui")
	master_ui.connect("back_pressed", self, "_switch_ui")
	master_ui.connect("utterred", self, "_on_utter")

func _switch_ui():
	url = "http://" + main_menu_ui.get_text() + "/utterance"
	main_menu_ui.visible = !main_menu_ui.visible
	master_ui.visible = !master_ui.visible

func _on_utter(text):
	http_request.cancel_request()
	var query = JSON.print({'utterance': text})
	var headers = ["Content-Type: application/json"]
	http_request.request(url, headers, false, HTTPClient.METHOD_POST, query)
