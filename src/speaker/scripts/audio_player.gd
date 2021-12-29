extends AudioStreamPlayer

export(Array, Resource) var resource

export var folder = ""
var stream_dict = {}

func _ready():
	self.load_stream_dict()
	
func play_sound(text):
	if not self.playing:
		if text in stream_dict:
			self.stream = stream_dict[text]
			self.play()

func load_stream_dict():
	var dir = Directory.new()
	if dir.open("res://sounds") == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with("import"):
				var file_parts = file_name.split(".")
				stream_dict[file_parts[0]] = ResourceLoader.load(
					"res://sounds/" + file_parts[0] + "." + file_parts[1]
				)
			file_name = dir.get_next()
