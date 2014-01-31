package 
{
	public class ScriptTriggerRepeat extends ScriptTrigger
	{
		public function ScriptTriggerRepeat(_condition:Function, callback:Function) {
			super(_condition, function():void {
				ontrigger();
				callback();
			});
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