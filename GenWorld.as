package 
{
	import net.flashpunk.Entity;
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
			add(new TestEntity(this, 7*24, 36));
			add(new BGTile(this, 0, 0));
			add(new Collectible(this, 6*24, 0));
			add(new Collectible(this, 3*24, 3*24));
			add(new Collectible(this, 11*24, 5*24));
			add(new Collectible(this, 0, 6*24));
			add(new Solid(this, 4*24, 3*24));
			add(new Solid(this, 5*24, 5*24));
			add(new Solid(this, 2*24, 5*24));
			add(new Solid(this, 9*24, 4*24));
			add(new Solid(this, 8*24, 2*24));
			add(new Solid(this, 7*24, 6*24));
			add(new Solid(this, 11*24, 7*24));
			add(new Solid(this, 11*24, 24));
		}
	}
	
}