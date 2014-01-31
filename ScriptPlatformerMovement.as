package 
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class ScriptPlatformerMovement extends ScriptAuto
	{
		// platformer sideways movement
		
		public function ScriptPlatformerMovement(acc:Number, slow:Number) {
			super(function():void {
				if (Input.check(Key.LEFT)) {
					if (target.dx > 0) target.dx = 0;
					target.dx -= acc;
				}
				if (Input.check(Key.RIGHT)) {
					if (target.dx < 0) target.dx = 0;
					target.dx += acc;
				}
				target.dx /= slow;
			});
		}
		
		override public function init():void {
			type = "movement";
		}
		
	}
	
}