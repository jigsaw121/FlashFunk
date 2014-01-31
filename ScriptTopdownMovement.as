package 
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class ScriptTopdownMovement extends ScriptAuto
	{
		// top-down movement
		
		public function ScriptTopdownMovement(acc:Number, slow:Number) {
			super(function():void {
				if (Input.check(Key.LEFT)) {
					if (target.dx > 0) target.dx = 0;
					target.dx -= acc;
				}
				if (Input.check(Key.RIGHT)) {
					if (target.dx < 0) target.dx = 0;
					target.dx += acc;
				}
				if (Input.check(Key.UP)) {
					if (target.dy > 0) target.dy = 0;
					target.dy -= acc;
				}
				if (Input.check(Key.DOWN)) {
					if (target.dy < 0) target.dy = 0;
					target.dy += acc;
				}
				target.dx /= slow;
				target.dy /= slow;
			});
		}
		
		override public function init():void {
			type = "movement";
		}
		
	}
	
}