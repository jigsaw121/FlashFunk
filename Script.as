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
			targetinit();
		}
		
		public function targetinit():void {
		}
		
		private function track():Tracker {
			return world().track;
		}
		private function world():GenWorld {
			return target.host;
		}
		
		public function act():void {
			// do something with target
		}
	}
	
}