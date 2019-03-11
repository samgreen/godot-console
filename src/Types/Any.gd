extends ConsoleBaseType

class_name ConsoleTypeAny

# @var  Variant
var _value

func _init():
  _name = 'Any'

# @param  Variant  value
func check(value):  # int
  _value = value
  return OK

func getValue():  # Variant
  return _value
