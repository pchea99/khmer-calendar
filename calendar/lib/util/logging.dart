class Logging{
	static bool _isLogged = true;

	static void logInfo(String msg){
		if(_isLogged) {
			print("<i> : $msg");
		}
	}

	static void logWarning(String msg){
		if(_isLogged) {
			print("<w> : $msg");
		}
	}

	static void logError(String msg){
		if(_isLogged) {
			print("<e> : $msg");
		}
	}
}