extends Spatial

signal uttering_received(result, body)

var request_in_progress = false
var url = ""

func set_url(new_url):
	url = new_url

func _ready():
# warning-ignore:return_value_discarded
	$Request.connect("request_completed", self, "_on_request_completed")
# warning-ignore:return_value_discarded
	$Timer.connect("timeout", self, "_on_timer_timeout")

func _on_timer_timeout():
	if not request_in_progress:
		$Request.request(url)
		request_in_progress = true

func _on_request_completed(result, _response_code, _headers, body):
	request_in_progress = false
	emit_signal("uttering_received", result, body)
