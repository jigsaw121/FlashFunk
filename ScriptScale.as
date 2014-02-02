package 
{
	public class ScriptScale extends ScriptAuto
	{
		public function ScriptScale(speed:Number):void {
			super(function():void {
				target.img.scale += speed;
			});
		}
		
		override public function init():void {
			type = "scale";
		}
	}
	
}