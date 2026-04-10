extends Control

func _ready() -> void:
	for _button in get_tree().get_nodes_in_group("button"):
		if _button is Button:
			_button.pressed.connect(_on_button_pressed.bind(_button))

func _on_button_pressed(_button: Button) -> void:
	var b_name = _button.name

	# 1. Tratamento para botões com funções fixas
	match b_name:
		"home":
			get_tree().change_scene_to_file("res://ui/menu.tscn")
		"previous":
			pass
		"next":
			pass

	# 2. Tratamento Automático para o Glossário
	# Se não caiu no match acima, o script assume que o nome do botão é o nome da cena
	var path = "res://ui/glossaryPages/suspectsList/" + b_name + "_glossary.tscn"
	
	if FileAccess.file_exists(path):
		get_tree().change_scene_to_file(path)
	else:
		# Isso ajuda muito no debug se você digitar algo errado no editor
		print("ERRO: Tentativa de carregar cena inexistente: ", path)
