package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class Main extends Engine
	{
		public function Main() {
			super(320, 200, 60, true);

			FP.screen.color = 0x808080;
			FP.screen.scale = 2;
			FP.volume = 0.4;
			
			FP.world = new GenWorld();
		}

		override public function init():void {
		}
	}
}