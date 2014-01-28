package 
{
	public class ScriptTrigger extends Script
	{
		// waits for a condition to happen, triggers a consequence
		
		public var condition:Function;
		public var callback:Function;
		
		public function ScriptTrigger(_condition:Function, _callback:Function) {
			condition = _condition; callback = _callback;
		}
		
		override public function init():void {
			type = "trigger";
		}
		
		private function trigger():void {
			if (condition()) {
				callback();
				target.remove_script(this);
			}
		}
		
		override public function act():void {
			trigger();
		}
	}
	
}