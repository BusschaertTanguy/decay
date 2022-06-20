extends KinematicBody2D

const SPEED: int = 80;
var _velocity: Vector2;

func _ready():
	$AnimatedSprite.animation = "idle";
	$AnimatedSprite.play();

func _process(delta: float) -> void:
	var direction = _get_movement_direction();
	_velocity = direction * SPEED;
	
	var animation = "idle" if _velocity == Vector2.ZERO else "run"; 
	$AnimatedSprite.animation = animation;
	
	if direction.x != 0:
		$AnimatedSprite.flip_h = direction.x < 0;

func _physics_process(delta: float) -> void:
	_velocity = move_and_slide(_velocity);

func _get_movement_direction() -> Vector2:
	var direction = Vector2.ZERO;
	
	if(Input.is_action_pressed("move_right")):
		direction.x += 1;
	
	if(Input.is_action_pressed("move_left")):
		direction.x -= 1;
	
	if(Input.is_action_pressed("move_down")):
		direction.y += 1;
	
	if(Input.is_action_pressed("move_up")):
		direction.y -= 1;
		
	return direction.normalized();
