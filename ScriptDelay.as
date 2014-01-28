package 
{
	public class ScriptDelay extends Script
	{
		public var delay:int;
		public var callback:Function;
		
		public function ScriptDelay(_delay:int, _callback:Function) {
			delay = _delay; callback = _callback;
		}
		
		override public function init():void {
			type = "delay";
		}
		
		private function decay():void {
			if (delay <= 0) {
				callback();
				target.remove_script(this);
				return;
			}
			delay--;
		}
		
		override public function act():void {
			decay();
		}
	}
	
}