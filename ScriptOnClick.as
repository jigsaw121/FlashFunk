package 
{
	public class ScriptOnClick extends ScriptTrigger
	{
		public function ScriptOnClick(_callback:Function) {
			super(function():Boolean {
				return track().mousefree && 
				track().lclick &&
				target.collidePoint(target.x, target.y, track().mousex, track().mousey);
			}, 
			function():void {
				track().mousefree = false;
				_callback();
			});
		}
		
		override public function init():void {
			type = "onclick";
		}
	}
	
}