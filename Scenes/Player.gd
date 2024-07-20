extends CharacterBody2D

@export var inv: Inv

func collect(item):
	inv.insert(item)
