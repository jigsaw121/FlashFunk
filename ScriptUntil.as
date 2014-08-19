package 
{
	public class ScriptUntil extends ScriptTrigger
	{
		public function ScriptUntil(_condition:Function, _callback:Function) {
			super(_condition, _callback);
		}
		
		override public function trigger():void {
			callback();
			if (condition()) {
				remove();
			}
		}
	}
	
}