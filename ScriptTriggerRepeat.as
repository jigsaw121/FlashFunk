package 
{
	public class ScriptTriggerRepeat extends ScriptTrigger
	{
		public var ontrigger:Function;
		
		public function ScriptTriggerRepeat(_condition:Function, callback:Function) {
			ontrigger = function():void {}
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