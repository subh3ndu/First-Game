extends Node

var SERVER_PORT = 8080
var SERVER_IP = "127.0.0.1"

var multiplayer_scene = preload("res://scenes/multiplayer_player.tscn")

var _players_spawn_node

func become_host():
	_players_spawn_node = get_tree().get_current_scene().get_node("Players") # this has to be done everytime the host is created
	
	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(SERVER_PORT) # .create_server(port)
	
	
	multiplayer.multiplayer_peer = server_peer
	
	multiplayer.peer_connected.connect(_add_player_to_game)
	multiplayer.peer_disconnected.connect(_del_player)	

func join_as_player2():
	var client_peer = ENetMultiplayerPeer.new()
	client_peer.create_client(SERVER_IP, SERVER_PORT) # .create_client(ip, port)
	
	multiplayer.multiplayer_peer = client_peer

func _add_player_to_game(id: int):
	var player_to_add = multiplayer_scene.instantiate()
	player_to_add.player_id = id
	player_to_add.name = str(id) # added to make it easier to detect authority
	
	_players_spawn_node.add_child(player_to_add, true)
	# get_tree().get_current_scene().get_node("Player").queue_free()

func _del_player(id: int):
	print("Player %s left the game !" % id)
