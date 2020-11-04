extends TreePart

class_name Bamboo

func _init(parent = null).(parent):
  pass
  
func addSkin(color : Color):
  var skin = load("res://tree/skin/SimpleTreePartSkin.tscn").instance()
  skin._init(color)
# warning-ignore:return_value_discarded
  self.connect("distance_change", skin, "setDistance")
# warning-ignore:return_value_discarded
  self.connect("size_change", skin, "setSize")
  .add_child(skin)
  
  
func _ready():
  addSkin(Color(0.2, 0.97, 1, 0.5))
  .setGrowTask( PrioritizedTasks.new([
      ParallelTasks.new([
        GrowSizeTask.new(self, 1),
        GrowDistanceTask.new(self, 2),
      ]),
      GrowChildTask.new(self, "createBambooChild")
    ])
  )
  
func createBambooChild():
  var child = load("res://tree/bamboo/Bamboo.tscn").instance()
  child._init(self)
  return child
