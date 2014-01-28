package 
{
	public class ScriptScroll extends ScriptAuto
	{
		public function ScriptScroll(dx:Number, dy:Number) {
			super(function():void {
				target.x += dx; target.y += dy;
			});
		}
	}
	
}