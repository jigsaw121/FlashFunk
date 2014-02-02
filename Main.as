package
{
	// replace references to the example world here with your own creations
	import coinget.CoinGetWorld;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class Main extends Engine
	{
		[Embed(source = 'AtariST8x16SystemFont.ttf', embedAsCFF="false", fontFamily = 'atari')]
		private const ATARI_FONT:Class;

		public function Main() {
			super(320, 200, 60, true);

			FP.screen.color = 0x908090;
			FP.screen.scale = 2;
			FP.volume = 0.4;
			
			FP.world = new CoinGetWorld();
		}

		override public function init():void {
		}
	}
}