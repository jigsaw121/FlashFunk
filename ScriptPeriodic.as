package 
{
	public class ScriptPeriodic extends ScriptTriggerRepeat
	{
		// a bit clumsy without multiple inheritance from repeat and delay scripts
		
		public var delay:int;
		
		public function ScriptPeriodic(_delay:int, _callback:Function) {
			delay = _delay;
			super(function():Boolean { 
				if (delay <= 0) {
					delay = _delay;
					return true;
				}
				delay--; return false;
			}, _callback);
		}
		
		override public function init():void {
			type = "periodic";
		}
		
	}
	
}