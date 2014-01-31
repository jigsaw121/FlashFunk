package 
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class Tracker extends Gentity
	{
		// manager sorta class, used for global data/updates etc.
		
		public var frame:int = 0;
		public const size:int = 24;
		public const scr_w:int = 320;
		public const scr_h:int = 200;
		public var mousex:int;
		public var mousey:int;
		public var lclick:Boolean;
		public var mousefree:Boolean;
		
		public function Tracker(_host:GenWorld) {
			super(_host);
		}
		
		public function reset(frames:int):void {
			// delayed reset
			delay(frames, host.reset);
		}
		
		public function announce(msg:String):void {
			// plain boring text
			var anc:GUIText = write(0, 0, function():String {
				return msg;
			});
			
			delay(100, anc.die);
		}
		
		override public function init():void {
			always(function():void {
				frame++;
			});
			always(function():void {
				mousex = Input.mouseX; mousey = Input.mouseY;
				lclick = Input.mousePressed;
				mousefree = true;
			}); 
			when(function():Boolean {
				return Input.pressed(Key.R);
			},
			host.reset);
		}		
	}
	
}