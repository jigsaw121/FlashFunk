package 
{
	public class TestEntity extends Gentity 
	{
		public function TestEntity(_host:GenWorld, _x:Number=0.0, _y:Number=0.0) {
			// could be in a manually called init() function
			// so everything doesn't have to take the same arguments
			super(_host, _x, _y);
		}
		
		override public function scriptinit():void {
			var mvmt:ScriptMovement = add_script(new ScriptMovement()) as ScriptMovement;
			
			add_script(new ScriptRotate(2.2));
			
			add_script(new ScriptDelay(75, function():void {
				remove_script_type("movement");
				add_script(new ScriptAuto(function():void {
					dx /= mvmt.slow;
					dy /= mvmt.slow;
					x += dx;
					y += dy;
				}));
			}));
			
			// note that the trigger script only happens once in contrast to autoscripts
			add_script(new ScriptTrigger(function():Boolean {
				return x < 0 || x > host.track.scr_w;
			}, host.reset));
			
			add_script(new ScriptAuto(function():void {
				if (y > host.track.scr_h)
					y = 0;
			}));
		}
	}
	
}