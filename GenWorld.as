package 
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	public class GenWorld extends World
	{
		public var track:Tracker;
		public var vars:Object = {};
		
		public function GenWorld() {
			init();
		}
		
		public function make_tracker():Tracker {
			// if you want to add more functionalities to a tracker, override this
			// (you might also want to add virtual functions to the basic tracker
			// to not have to cast every time you refer to those)
			return new Tracker(this);
		}
		public function init():void {
			removeAll();
			track = make_tracker();
			add(track);
			
			spawn();
		}
		public function reset():void {
			// get class type, then create a new instance of it
			FP.world = new (Object(this).constructor)();
		}
		
		public function every(lst:Array, func:Function):void {
			for each (var g:* in lst) {
				func(g);
			}
		}
		public function allt(strtype:String):Array {
			var all:Array = [];
			getType(strtype, all);
			return all;
		}
		public function allc(classtype:Class):Array {
			var all:Array = [];
			getClass(classtype, all);
			return all;
		}
		public function everyt(strtype:String, op:Function):void {
			everya(allt(strtype), op);
		}
		public function everyc(classtype:Class, op:Function):void {
			everya(allc(classtype), op);
		}
		public function everya(arr:Array, op:Function):void {
			for each (var g:* in arr) {
				op(g);
			}
		}
		public function everyf(arr:Array, op:Function):Function {
			return function():void { everya(arr, op); }
		}
		public function counttype(strtype:String):int {
			return allt(strtype).length;
		}
		public function countclass(classtype:Class):int {
			return allc(classtype).length;
		}
		public function flash(color:int, blend:String="normal"):void {
			var box:Gentity = add(new Gentity(this, track.scr_w/2, track.scr_h/2)) as Gentity;

			box.clear_images();
			box.add_rectimg(track.scr_w, track.scr_h, color);
			box.img.x = 0; box.img.y = 0; box.img.centerOO();
			box.img.blend = blend;
			
			box.img.alpha = 0;
			box.dx = 0.1;
			box.layer = -64;
			
			box.always(function():void {
				var tgt:Gentity = (this as Script).target;
				tgt.img.alpha += tgt.dx;
				if (tgt.img.alpha >= 1) {
					tgt.img.alpha = 1;
					tgt.dx = -tgt.dx/4.0;
				}
				if (tgt.img.alpha <= 0) {
					tgt.img.alpha = 0;
					tgt.die();
				}
			});
		}
		
		public function tweenfunc(obj:*, varname:String):Function {
			return function(n:*):void {
				obj[varname] = n;
			}
		}
		
		public function spawn():void {
		}
	}
	
}