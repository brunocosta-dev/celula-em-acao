extends Control

func _ready() -> void:
	for _button in get_tree().get_nodes_in_group("button"):
		_button.pressed.connect(_on_button_pressed.bind(_button))

func _on_button_pressed(_button: Button) -> void:
	match _button.name:
		"newGameButton":
			get_tree().change_scene_to_file("res://scenes/levels/game_board.tscn")
		"tutorialButton":
			get_tree().change_scene_to_file("res://ui/tutorialPages/tutorial.tscn")
		"glossaryButton":
			get_tree().change_scene_to_file("res://ui/glossaryPages/listGlossary.tscn")
		"creditsButton":
			get_tree().change_scene_to_file("res://ui/creditsPages/credits.tscn")
		"quitButton":
			get_tree().quit()
