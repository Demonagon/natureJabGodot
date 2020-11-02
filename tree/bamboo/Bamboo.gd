extends TreePart

class_name Bamboo

func _init(parent = null).(parent):
  pass
  
func _ready():
  .setGrowTask( ParallelTasks.new([
    GrowSizeTask.new(self, 1),
    GrowDistanceTask.new(self, 2),
   ]) )
