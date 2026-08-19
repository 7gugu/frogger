extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var speed: int = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	animation()
	move_and_slide()

func animation():
	if direction:
		$AnimatedSprite2D.flip_h = direction.x > 0
		if direction.x != 0:
			$AnimatedSprite2D.animation = 'left'
		else:
			if direction.y < 0:
				$AnimatedSprite2D.animation = 'up'
			else:
				$AnimatedSprite2D.animation = 'down'
	else:
		$AnimatedSprite2D.frame = 0
