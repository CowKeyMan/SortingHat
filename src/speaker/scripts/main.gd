# Mediator for everything
# Parses input from Ping and gives the utterance to audio player
# If Ping returns a bad value, it shows it using the Connected node

extends Spatial

onready var ping = $Ping
onready var audio_player = $AudioPlayer
onready var ui = $UI

var random_no = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	ping.set_url(_format_url(ui.get_text()))
# warning-ignore:return_value_discarded
	ui.connect("text_changed", self, "_on_TextBox_text_changed")
	ping.connect("uttering_received", self, "_on_Ping_uttering_recieved")
	ping.connect("request_error", ui, "set_disconnected")

func _format_url(url):
	return "http://" + url + "/utterance"

func _on_TextBox_text_changed(text):
	ping.set_url(_format_url(text))
	
func _on_Ping_uttering_recieved(result, body):
	if result != 0:
		ui.set_disconnected()
		return
	ui.set_connected()
	var contents = JSON.parse(body.get_string_from_utf8()).result
	if contents["random_no"] != random_no:
		random_no = contents["random_no"]
		var utterance = contents["utterance"]
		if utterance == "stop":
			audio_player.stop()
		else:
			audio_player.play_sound(utterance)
