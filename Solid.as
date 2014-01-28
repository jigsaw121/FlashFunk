package 
{
	public class Solid extends Gentity 
	{
		public function Solid(_host:GenWorld, _x:Number=0.0, _y:Number=0.0) {
			super(_host, _x, _y);
		}
		
		override public function typeinit():void {
			type = "solid";
		}
		
		override public function imginit():void {
			add_rectimg(width, height, 0x606080);
		}
	}
	
}