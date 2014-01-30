package 
{
	public class ScriptTriggerRepeat extends ScriptTrigger
	{
		public function ScriptTriggerRepeat(_condition:Function, _callback:Function) {
			super(_condition, _callback);
		}
		
		override public function init():void {
			type = "repeat";
		}
		
		override public function trigger():void {
			if (condition()) {
				callback();
				// not removed automatically
			}
		}
	}
	
}