package 
{
	public class ScriptTrigger extends Script
	{
		// basically a variation on the delay function (with no predefined delay)
		// catches events and gives a result
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
				return;
			}
		}
		
		override public function act():void {
			trigger();
		}
	}
	
}