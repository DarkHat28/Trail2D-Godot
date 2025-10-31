class_name Trail
extends Node2D


@onready var trail: Marker2D = $Trail
@onready var trail_line: Line2D = %TrailLine
@onready var length_slider: HSlider = %LengthSlider
@onready var width_slider: HSlider = %WidthSlider
@onready var parameter_display: Label = %ParameterDisplay


@export_category("Trail Parameters")
@export var trail_length: float
@export var trail_width: float

func _ready() -> void:
	trail_line.length = trail_length
	length_slider.value = trail_length
	
	trail_line.width = trail_width
	width_slider.value = trail_width

func _process(_delta: float) -> void:
	trail_line.length = length_slider.value
	trail_line.width = width_slider.value
	## Please, Don't mind this line for bunch of "\n".. ;D
	parameter_display.text = "Length    " + "\n" + str(length_slider.value) + "\n" + "\nWidth   " + "\n" + str(width_slider.value)


func _physics_process(_delta: float) -> void:
	trail.global_position = get_global_mouse_position()


func _on_slider_value_changed(_value: float) -> void:
	trail_line.clear_points() ## If you dont want line disappear faster then comment out this line and see, but for sword slash effect i would recommend leave it as it is.
	pass


func _on_width_slider_value_changed(value: float) -> void:
	trail_width = width_slider.value
