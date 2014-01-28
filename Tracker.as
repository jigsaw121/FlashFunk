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
			add_script(new ScriptAuto(function():void {
				frame++;
			}));
			add_script(new ScriptAuto(function():void {
				if (Input.pressed(Key.R)) host.reset();
			}));
		}
		
		public function reset(delay:int):void {
			// delayed reset
			add_script(new ScriptDelay(delay, host.reset));
		}
		
		public function announce(msg:String):void {
			// flashy scrolling text
			var anc:GUIText = host.add(new GUIText(host, scr_w / 2, scr_h, function():String {
				return msg;
			})) as GUIText;
			anc.center(anc.img);
			var sc:Script = add_script(new ScriptScroll(0, -2));
			sc.set_target(anc);
			
			// pause in the center of the screen, then scroll up again
			add_script(new ScriptTrigger(function():Boolean 
			{
				return anc.y <= scr_h/2;
			},
			function():void 
			{
				remove_script(sc);
				
				add_script(new ScriptDelay(30, function():void 
				{
					add_script(sc);
					// have to re-set target because of add_script
					sc.set_target(anc);
				}));
				
			}));
			
			add_script(new ScriptTrigger(function():Boolean {
				return anc.y < -24;
			}, 
			function():void {
				anc.die();
			}));
		}
		
		override public function init():void {
		}
		
	}
	
}