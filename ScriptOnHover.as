package 
{
	public class ScriptOnHover extends ScriptOnClick
	{
		public function ScriptOnHover(_callback:Function) {
			super(_callback);
		}
		
		override public function lclick():Boolean {
			return true;
		}
		
		override public function init():void {
			type = "onhover";
		}
	}
	
}