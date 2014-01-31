package 
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class ScriptGravity extends ScriptAuto
	{
		public function ScriptGravity(grav:Number) {
			super(function():void {
				target.dy += grav;
			});
		}
		
		override public function init():void {
			type = "movement";
		}
		
	}
	
}