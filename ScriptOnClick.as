package 
{
	public class ScriptOnClick extends ScriptTrigger
	{
		public function ScriptOnClick(_callback:Function) {
			super(function():Boolean {
				return track().mousefree && 
				lclick() &&
				target.collidePoint(target.x, target.y, track().mousex, track().mousey);
			}, 
			function():void {
				track().mousefree = false;
				_callback();
			});
		}
		
		public function lclick():Boolean {
			return track().lclick;
		}
		
		override public function init():void {
			type = "onclick";
		}
	}
	
}