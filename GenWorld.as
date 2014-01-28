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
		public function spawn():void {
			add(new TestEntity(this, track.scr_w/2, 36));
			add(new BGTile(this, 0, 0));
		}
	}
	
}