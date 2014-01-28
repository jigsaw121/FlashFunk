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
			track = new Tracker(this);
			add(track);
		}
	}
	
}