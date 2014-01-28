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
			var g:Gentity = new Gentity(this, 36, 36);
			add(g);
			g.add_script(new ScriptMovement());
			g.add_script(new ScriptDelay(30, function():void {
				g.remove_script_type("movement");
			}));
			g.add_script(new ScriptTrigger(function():Boolean {
				return g.x < 0;
			}, this.reset));
		}
	}
	
}