package 
{
	public class ScriptDelay extends ScriptTrigger
	{
		public function ScriptDelay(delay:int, _callback:Function) {
			super(function():Boolean { 
				delay--; 
				return delay <= -1;
			}, _callback);
		}
		
		override public function init():void {
			type = "delay";
		}
		
	}
	
}