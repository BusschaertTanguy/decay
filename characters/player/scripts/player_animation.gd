class_name PlayerAnimation
extends AnimatedSprite

func _ready() -> void:
	self.animation = "idle";
	self.play();
	
func apply_animation(direction: Vector2) -> void:
	var is_idle = direction == Vector2.ZERO;
	var animation = "idle" if is_idle else "run"; 
	
	self.animation = animation;
	
	if direction.x != 0:
		self.flip_h = direction.x < 0;
