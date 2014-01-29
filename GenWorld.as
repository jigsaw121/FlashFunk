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
		public function init():void {
			removeAll();
			track = new Tracker(this);
			add(track);
			
			spawn();
		}
		public function reset():void {
			FP.world = new GenWorld();
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