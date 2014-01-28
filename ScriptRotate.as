package 
{
	public class ScriptRotate extends ScriptAuto
	{
		public function ScriptRotate(speed:Number) {
			super(function():void {
				target.img.angle += speed;
			});
		}
		
		override public function init():void {
			type = "rotate";
		}
		
		override public function targetinit():void {
			target.img.centerOO();
		}
	}
	
}