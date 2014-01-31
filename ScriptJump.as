package 
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class ScriptJump extends ScriptTrigger
	{
		public function ScriptJump(force:Number) {
			super(function():Boolean {
				if (Input.pressed(Key.UP)) {
					target.dy -= force;
					return true;
				}
				return false;
			}, function():void {
			});
		}
		
		override public function init():void {
			type = "movement";
		}
		
	}
	
}