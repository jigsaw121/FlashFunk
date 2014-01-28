package 
{
	import net.flashpunk.World;
	
	public class GenWorld extends World
	{
		public var track:Tracker;
		
		public function GenWorld() {
			reset();
		}
		public function reset():void {
			removeAll();
			track = new Tracker(this);
			add(track);
			
			spawn();
		}
		public function spawn():void {
			add(new TestEntity(this, track.scr_w/2, 36));
		}
	}
	
}