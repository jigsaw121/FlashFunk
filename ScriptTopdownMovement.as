package 
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class ScriptTopdownMovement extends ScriptAuto
	{
		// top-down movement
		public var acc:Number;
		public var slow:Number;
		
		public function ScriptTopdownMovement(_acc:Number, _slow:Number) {
			acc = _acc; slow = _slow;
			super(make_callback());
		}
		
		public function make_callback():Function {
			return function():void {
				move();
				target.dx /= slow;
				target.dy /= slow;
			}
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
			if (Input.check(Key.UP)) {
				if (target.dy > 0) target.dy = 0;
				target.dy -= acc;
			}
			if (Input.check(Key.DOWN)) {
				if (target.dy < 0) target.dy = 0;
				target.dy += acc;
			}
		}
		
		override public function init():void {
			type = "movement";
		}
		
	}
	
}