class_name Player
extends KinematicBody2D

var PlayerController = load("characters/player/scripts/PlayerController.gd");

const SPEED: int = 80;
var _direction: Vector2;
var _controller = PlayerController.new();

func _process(_delta: float) -> void:
	_direction = _controller.get_direction();
	$AnimatedSprite.apply_animation(_direction);

func _physics_process(_delta: float) -> void:
	var velocity = _direction * SPEED;
	velocity = move_and_slide(velocity);
