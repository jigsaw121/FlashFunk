package 
{
	public class ScriptDelay extends ScriptTrigger
	{
		public var delay:int;
		
		public function ScriptDelay(_delay:int, _callback:Function) {
			delay = _delay;
			super(function():Boolean { 
				if (delay <= 0) return true;
				delay--; return false;
			}, _callback);
		}
		
		override public function init():void {
			type = "delay";
		}
		
	}
	
}