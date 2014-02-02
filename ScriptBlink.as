package 
{
	public class ScriptBlink extends ScriptPeriodic
	{
		public function ScriptBlink(interval:int) {
			super(interval, function():void {
				target.visible = !target.visible;
			})
		}
		
	}
	
}