package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class Tracker extends Gentity
	{
		// manager sorta class, used for global data/updates etc.
		
		public var frame:int = 0;
		
		public var size:int = 24;
		public static var SCR_W:int = 320;
		public static var SCR_H:int = 200;
		public var scr_w:int;
		public var scr_h:int;
		
		public var mousex:int;
		public var mousey:int;
		public var lclick:Boolean;
		public var mousefree:Boolean;
		
		public var paused:Array = [];
		
		public function Tracker(_host:GenWorld) {
			scr_w = SCR_W; scr_h = SCR_H;
			super(_host);
		}
		
		public function reset(frames:int):void {
			// delayed reset
			delay(frames, host.reset);
		}
		
		public function report(msg:String):void {
			// plain boring text
			
			var anc:GUIText = write(0, 0, function():String {
				return msg;
			});
			
			delay(100, anc.die);
		}
		
		public function announce(msg:String):void {
			// flashy scrolling text
			
			var anc:GUIText = write(scr_w/2, scr_h, function():String {
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
			anc.die);
		}	
		
		override public function pause():void {
			// if something is being added on the same frame, it avoids being paused
			// depending on use, this can be a feature or a bug...
			var all:Array = [];
			host.getAll(all);
			for each (var e:Entity in all) {
				// disregard if already paused so unpausing won't affect it
				if (!e.active) continue;
				if (e === this) continue;
				paused.push(e); e.active = false;
			}
		}
		override public function unpause():void {
			for each (var p:Entity in paused) {
				p.active = true;
			}
			paused = [];
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