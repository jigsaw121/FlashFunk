package 
{
	public class Script
	{
		// target could be typeless to allow scripts checking scripts
		public var target:Gentity;
		public var type:String;
		
		public function Script() {
			init();
		}
		
		public function init():void {
			type = "script";
		}
		
		public function set_target(_target:Gentity):void {
			target = _target;
		}
		
		public function track():Tracker {
			return world().track;
		}
		public function world():GenWorld {
			return target.host;
		}
		
		public function act():void {
			// do something with target
		}
	}
	
}