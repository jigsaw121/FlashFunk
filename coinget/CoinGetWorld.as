package coinget
{
	import net.flashpunk.FP;
	
	public class CoinGetWorld extends GenWorld
	{
		public function CoinGetWorld() {
			super();
		}
		
		override public function make_tracker():Tracker {
			return new FlashyTracker(this);
		}
		
		override public function spawn():void {
			add(new CoinGetPlayer(this, 7*24, 36));
			add(new AnimTile(this, 0, 0));
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