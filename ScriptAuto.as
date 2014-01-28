package 
{
	public class ScriptAuto extends Script
	{
		// for defining always-on scripts on the fly
		
		public var action:Function;
		
		public function ScriptAuto(_action:Function) {
			super();
			action = _action;
		}
		
		override public function init():void {
			type = "auto";
		}
		
		override public function act():void {
			action();
		}
	}
	
}