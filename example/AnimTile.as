package example
{
	import net.flashpunk.graphics.Image;
	
	public class AnimTile extends Gentity
	{
		public function AnimTile(_host:GenWorld, _x:Number, _y:Number) {
			super(_host, _x, _y);
			layer = 1;
			
			delay(0, function():void {
				_x += 24; 
				if (_x >= host.track.scr_w) { _x = 0; _y += 24; }
				if (_y >= host.track.scr_h) return;
				
				host.add(new AnimTile(host, _x, _y));
			});
			
			var sc:Script = add_script(new ScriptRotate(5));

			when(function():Boolean {
				return img.angle >= 45;
			}, function():void {
				img.angle = 45;
				remove_script(sc);
			});
		}
		
		override public function sizeinit():void {
			width = 17; height = 17;
		}
		
		override public function imginit():void {
			add_rectimg(width, height, 0x9090B0);
		}
	}
	
}