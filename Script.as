package 
{
	public class Script
	{
		public var target:Gentity;
		
		public function Script(_target:Gentity) {
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