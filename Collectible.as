package 
{
	public class Collectible extends Gentity 
	{
		public function Collectible(_host:GenWorld, _x:Number=0.0, _y:Number=0.0) {
			super(_host, _x, _y);
		}
		
		override public function typeinit():void {
			type = "collectible";
		}
		
		override public function imginit():void {
			add_rectimg(width, height, 0xA0A080);
		}
	}
	
}