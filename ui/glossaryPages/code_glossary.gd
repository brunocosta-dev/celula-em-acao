extends Control

# O "Mapa" do seu glossário/investigação na ordem correta
const NAVIGATION_ORDER = [
	"res://ui/menu.tscn",
	"res://ui/glossaryPages/listGlossary.tscn",
	"res://ui/glossaryPages/suspectsList/atpMutante_glossary.tscn",
	"res://ui/glossaryPages/suspectsList/celulaOrganizada_glossary.tscn",
	"res://ui/glossaryPages/suspectsList/enzimaCatalisadora_glossary.tscn",
	"res://ui/glossaryPages/suspectsList/mitocondriaZumbi_glossary.tscn",
	"res://ui/glossaryPages/suspectsList/mitoEnergetico_glossary.tscn",
	"res://ui/glossaryPages/suspectsList/organoideClonado_glossary.tscn",
	"res://ui/glossaryPages/suspectsList/oxigenioExplosivo_glossary.tscn",
	"res://ui/glossaryPages/suspectsList/radicalLivreSolto_glossary.tscn",
	"res://ui/glossaryPages/suspectsList/radicalRaivoso_glossary.tscn",
	"res://ui/glossaryPages/suspectsList/rnaMutante_glossary.tscn"
]

func _ready() -> void:
	for _button in get_tree().get_nodes_in_group("button"):
		if !_button.pressed.is_connected(_on_button_pressed):
			_button.pressed.connect(_on_button_pressed.bind(_button))

func _on_button_pressed(_button: Button) -> void:
	# 1. Descobre o caminho da cena atual
	var current_path = get_tree().current_scene.scene_file_path
	
	# 2. Encontra o índice (posição) atual na nossa lista
	var current_index = NAVIGATION_ORDER.find(current_path)

	match _button.name.to_lower():
		"home":
			get_tree().change_scene_to_file(NAVIGATION_ORDER[0])
		
		"next":
			# Se não for a última página, vai para a próxima
			if current_index != -1 and current_index < NAVIGATION_ORDER.size() - 1:
				var next_scene = NAVIGATION_ORDER[current_index + 1]
				get_tree().change_scene_to_file(next_scene)
			else:
				print("Última página")

		"previous":
			# Se não for a primeira (após o menu), volta uma
			if current_index > 0:
				var prev_scene = NAVIGATION_ORDER[current_index - 1]
				get_tree().change_scene_to_file(prev_scene)
