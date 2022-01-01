extends Spatial

signal uttering_received(result, body)
signal request_error()

var request_in_progress = false
var url = ""

func set_url(new_url):
	url = new_url

func _ready():
	$Request.connect("request_completed", self, "_on_request_completed")
	$Timer.connect("timeout", self, "_on_timer_timeout")

func _on_timer_timeout():
	if not request_in_progress:
		request_in_progress = true
		var err = $Request.request(url)
		if err != OK:
			emit_signal("request_error")

func _on_request_completed(result, _response_code, _headers, body):
	request_in_progress = false
	emit_signal("uttering_received", result, body)
