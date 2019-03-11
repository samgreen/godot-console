extends Reference

enum LOG_LEVEL {
	INFO,
	WARNING,
	ERROR,
	NONE
}

# @var  int
var logLevel = LOG_LEVEL.INFO setget setLogLevel

# @param  int  inlogLevel
func setLogLevel(inlogLevel = LOG_LEVEL.INFO) -> void:
	logLevel = inlogLevel

# @param  string  message
# @param  int     type
func log(message, type = LOG_LEVEL.INFO) -> void:
	match type:
		LOG_LEVEL.INFO:    info(message)
		LOG_LEVEL.WARNING: warn(message)
		LOG_LEVEL.ERROR:   error(message)

# @param  string  message
# @param  string  debugInfo
func info(message, debugInfo = '') -> void:
	if logLevel <= LOG_LEVEL.INFO:
		var write = make_log_tag("INFO", "#356080", debugInfo)
		write_tagged_log(write, message)

# @param  string  message
# @param  string  debugInfo
func warn(message, debugInfo = '') -> void:
	if logLevel <= LOG_LEVEL.WARNING:
		var write = make_log_tag("WARNING", "#FBF14A", debugInfo)
		write_tagged_log(write, message)

# @param  string  message
# @param  string  debugInfo
func error(message, debugInfo = '') -> void:
	if logLevel <= LOG_LEVEL.ERROR:
		var write = make_log_tag("ERROR", "#D55B65", debugInfo)
		write_tagged_log(write, message)

func network(message, debugInfo = ''):
	if logLevel <= LOG_LEVEL.INFO:
		var write = make_log_tag("NET", "#356080", debugInfo)
		write_tagged_log(write, message)

# @param  string  message
# @param  string  debugInfo
func debug(message, debugInfo = '') -> void:
	if Console.debugMode:
		var write = make_log_tag("DEBUG", "#6EBC3D", debugInfo)
		write_tagged_log(write, message)
	
func make_log_tag(name, color, debugInfo = '') -> String:
	var tag = "[color=%s][%s][/color] " % [color, name]
	if Console.debugMode:
		tag += " {" + str(debugInfo) + "} "
	return tag

func write_tagged_log(tag, message):
	Console.writeLine(tag + str(message))
	
