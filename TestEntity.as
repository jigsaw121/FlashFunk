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
			// this movement script only inputs dx/dy - you apply them separately
			// for example, axis separation makes tile aligning easier
			var mvmt:ScriptMovement = add_script(new ScriptMovement()) as ScriptMovement;

			// script order matters
			add_script(new ScriptAuto(movex));
			add_script(new ScriptCollision("solid", alignx));
			add_script(new ScriptAuto(movey));
			add_script(new ScriptCollision("solid", aligny));
			
			// doesn't matter that the timer and stop scripts have circular dependency
			// because of closure scope
			var stop:Script = new ScriptAuto(function():void {
				remove_script(timer);
				remove_script_type("movement");
				remove_script_type("collision");
				dx /= mvmt.slow; dy /= mvmt.slow;
			});
			
			add_script(new ScriptCollision("collectible", function(hit:Gentity):void {
				hit.die();
				timer.delay += 75;
				// the count doesn't immediately change when removing from world
				if (host.counttype("collectible") == 1) {
					add_script(stop);
					host.track.announce("clear");
					host.track.reset(140);
				}
			}));

			add_script(new ScriptRotate(2.2));
			
			var timer:ScriptDelay = add_script(new ScriptDelay(125, function():void {
				add_script(stop);

				host.track.announce("time out");
				host.track.reset(140);
			
			})) as ScriptDelay;
			
			host.add(new GUIText(host, 0, 0, function():String {
				return timer.delay.toString();
			}));
			
			// note that the trigger script only happens once in contrast to autoscripts
			add_script(new ScriptTrigger(function():Boolean {
				return x < 0 || x+width > host.track.scr_w;
			}, die));
			
			add_script(new ScriptAuto(function():void {
				if (y > host.track.scr_h) y = 0;
			}));
			
		}
		
		override public function die():void {
			host.remove(this);
			host.track.announce("whoops");
			host.track.reset(140);
		}
	}
	
}