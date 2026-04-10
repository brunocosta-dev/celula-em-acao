extends Control

func _ready() -> void:
	# 1. Botões de Navegação (Home, Prev, Next)
	for btn in get_tree().get_nodes_in_group("button"):
		if btn is Button:
			btn.pressed.connect(_on_nav_pressed.bind(btn))
	
	# 2. Botões de Suspeitos
	for btn in get_tree().get_nodes_in_group("listSuspect"):
		if btn is Button:
			btn.pressed.connect(_on_glossary_pressed.bind(btn, "suspectsList"))
			
	# 3. Botões de Salas
	for btn in get_tree().get_nodes_in_group("listRoom"):
		if btn is Button:
			btn.pressed.connect(_on_glossary_pressed.bind(btn, "roomsList"))

# Função para Navegação Geral
func _on_nav_pressed(_button: Button) -> void:
	match _button.name.to_lower():
		"home":
			get_tree().change_scene_to_file("res://ui/menu.tscn")
		"previous":
			pass
		"next":
			pass

# Função Genérica para o Glossário (Salas e Suspeitos)
func _on_glossary_pressed(_button: Button, folder: String) -> void:
	var path = "res://ui/glossaryPages/" + folder + "/" + _button.name + "_glossary.tscn"
	
	if FileAccess.file_exists(path):
		get_tree().change_scene_to_file(path)
	else:
		print("ERRO: Cena não encontrada em: ", path)
