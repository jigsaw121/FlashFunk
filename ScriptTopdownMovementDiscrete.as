package 
{
	public class ScriptTopdownMovementDiscrete extends ScriptTopdownMovement
	{
		// top-down movement with no sliding
		
		public function ScriptTopdownMovementDiscrete(acc:Number) {
			super(acc, 1);
		}
		
		override public function make_callback():Function {
			return function():void {
				target.dx = 0; target.dy = 0;
				move();
			}
		}	
	}
	
}