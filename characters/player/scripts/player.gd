class_name Player
extends KinematicBody2D

const PlayerController = preload("res://characters/player/scripts/player_controller.gd");
const PlayerStats = preload("res://characters/player/resources/player_stats.tres");

var _direction: Vector2;
var _controller = PlayerController.new();

func _process(_delta: float) -> void:
	_direction = _controller.get_direction();
	$AnimatedSprite.apply_animation(_direction);

func _physics_process(_delta: float) -> void:
	var velocity = _direction * PlayerStats.speed;
	velocity = move_and_slide(velocity);
