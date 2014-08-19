package 
{
	public class Script
	{
		// target could be typeless to allow scripts checking scripts
		public var target:Gentity;
		public var type:String;
		public var onexpire:Function;
		public var used:Boolean;
		
		public function Script() {
			onexpire = function():void {}
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
		
		public function track():Tracker {
			return world().track;
		}
		public function world():GenWorld {
			return target.host;
		}
		
		public function add():void {
			target.add_script(this);
		}
		public function reset():void {

		}
		public function remove():void {
			target.remove_script(this);
			onexpire();
		}
		
		public function act():void {
			// do something with target
		}
	}
	
}