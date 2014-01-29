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
		
			always(function():void {
				frame++;
			});
			always(function():void {
				if (Input.pressed(Key.R)) host.reset();
			});
		}
		
		public function reset(frames:int):void {
			// delayed reset
			delay(frames, host.reset);
		}
		
		public function announce(msg:String):void {
			// flashy scrolling text
			var anc:GUIText = write(scr_w / 2, scr_h, function():String {
				return msg;
			});
			anc.center(anc.img);

			var scroll:Script = add_script(new ScriptScroll(0, -2));
			scroll.set_target(anc);
			
			// pause in the center of the screen, then scroll up again
			when(function():Boolean 
			{
				return anc.y <= scr_h/2;
			},
			function():void 
			{
				remove_script(scroll);
				
				delay(30, function():void 
				{
					add_script(scroll);
					// have to re-set target because of add_script
					scroll.set_target(anc);
				});
			});
			
			when(function():Boolean {
				return anc.y < -24;
			}, 
			function():void {
				anc.die();
			});
		}
		
		override public function init():void {
		}
		
	}
	
}