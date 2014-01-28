package 
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class ScriptMovement extends Script
	{
		// platformer movement
		
		public var acc:Number = 1.0;
		public var slow:Number = 1.21;
		public var grav:Number = 0.2;
		
		public function ScriptMovement() {
		}
		
		override public function init():void {
			type = "movement";
		}
		
		private function move():void {
			if (Input.pressed(Key.LEFT)) {
				if (target.dx > 0) target.dx = 0;
				target.dx -= acc;
			}
			if (Input.pressed(Key.RIGHT)) {
				if (target.dx < 0) target.dx = 0;
				target.dx += acc;
			}
			target.dx /= slow;
			target.dy += grav;
			
			target.x += target.dx;
			target.y += target.dy;
		}
		
		override public function act():void {
			move();
		}
	}
	
}