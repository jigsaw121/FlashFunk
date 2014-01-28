package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class Tracker extends Gentity
	{
		// manager sorta class, used for global data/updates etc.
		public var frame:int = 0;
		public const size:int = 24;
		public const scr_w:int = 320;
		public const scr_h:int = 200;
		
		public function Tracker(_host:GenWorld) {
			super(_host);
		}
		
		override public function init():void {
		}
		
		override public function update():void {
			if (Input.pressed(Key.R)) {
				host.reset();
				return;
			}
			frame++;
		}
	}
	
}