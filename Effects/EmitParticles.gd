extends Effect

@onready var particles : GPUParticles2D = $GPUParticles2D

func activate(target : Object):
	if target is CollisionComponent:
		var new_particles : = particles.duplicate()
		target.add_child(new_particles)
		new_particles.emitting = true
		new_particles.global_position = target.global_position
		new_particles.finished.connect(new_particles.queue_free)
