package 
{
	public class ScriptRotate extends Script
	{
		public var speed:Number;
		
		public function ScriptRotate(_speed:Number) {
			super();
			speed = _speed;
		}
		
		override public function init():void {
			type = "rotate";
		}
		
		override public function targetinit():void {
			target.img.centerOO();
		}
		
		private function rotate():void {
			target.img.angle += speed;
		}
		
		override public function act():void {
			rotate();
		}
		
	}
	
}