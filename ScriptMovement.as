package 
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class ScriptMovement extends ScriptAuto
	{
		// platformer movement
		
		public var acc:Number = 1.0;
		public var slow:Number = 1.21;
		public var grav:Number = 0.2;
		
		public function ScriptMovement() {
			super(move);
		}
		
		override public function init():void {
			type = "movement";
		}
		
		public function move():void {
			if (Input.check(Key.LEFT)) {
				if (target.dx > 0) target.dx = 0;
				target.dx -= acc;
			}
			if (Input.check(Key.RIGHT)) {
				if (target.dx < 0) target.dx = 0;
				target.dx += acc;
			}
			target.dx /= slow;
			target.dy += grav;
		}
		
	}
	
}