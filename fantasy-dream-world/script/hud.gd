extends CanvasLayer

var coin = 0
var time = 0

@onready var label_coin = $Control/Label
@onready var label_time = $Timer/Label

func _ready():
	add_to_group("hud")
	label_time.text = "0"

func add_coin():
	coin += 1
	label_coin.text = "x " + str(coin)

func _on_timer_timeout():
	time += 1
	label_time.text = str(time)
