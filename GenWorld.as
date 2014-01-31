package 
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	public class GenWorld extends World
	{
		public var track:Tracker;
		
		public function GenWorld() {
			init();
		}
		
		public function make_tracker():Tracker {
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
		
		public function counttype(strtype:String):int {
			var all:Array = [];
			getType(strtype, all);
			return all.length;
		}
		public function countclass(classtype:Class):int {
			var all:Array = [];
			getClass(classtype, all);
			return all.length;
		}
		
		public function spawn():void {
		}
	}
	
}