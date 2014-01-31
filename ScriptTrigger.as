package 
{
	public class ScriptTrigger extends Script
	{
		// waits for a condition to happen, triggers a consequence
		
		public var condition:Function;
		public var callback:Function;
		public var ontrigger:Function;
		
		public function ScriptTrigger(_condition:Function, _callback:Function) {
			ontrigger = function():void {}
			condition = _condition; callback = _callback;
		}
		
		override public function init():void {
			type = "trigger";
		}
		
		public function trigger():void {
			if (condition()) {
				callback();
				remove();
			}
		}
		
		override public function act():void {
			trigger();
		}
	}
	
}