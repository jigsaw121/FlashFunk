package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class Main extends Engine
	{
		public function Main() {
			Tracker.SCR_W = 320; Tracker.SCR_H = 240;
			super(Tracker.SCR_W, Tracker.SCR_H, 60, true);

			FP.screen.color = FP.getColorRGB(224,224,224);
			FP.screen.scale = 2;
			FP.volume = 0.6;
			
			// replace this with a world of your own
			FP.world = new GenWorld();
		}

		override public function init():void {
			trace("Get this jam started");
		}
	}
}