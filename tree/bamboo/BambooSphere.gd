extends CSGSphere

func _ready():
  visible = false

func _on_Bamboo_size_change(newSize):
  visible = false if newSize <= 0 else true
  if newSize > 0:
    self.radius = newSize
