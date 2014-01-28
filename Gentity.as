package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	
	public class Gentity extends Entity 
	{
		public var host:GenWorld;
		public var scripts:Array = [];
		public var img:Image = null;
		public var dx:Number = 0.0; 
		public var dy:Number = 0.0;
		
		public function Gentity(_host:GenWorld, _x:Number=0.0, _y:Number=0.0) {
			host = _host; x = _x; y = _y;
			graphic = new Graphiclist();
			init();
		}
		
		public function init():void {
			// add scripts here
			width = host.track.size; height = host.track.size;
			typeinit();
			imginit();
		}
		
		public function typeinit():void {
			type = "entity";
		}
		
		public function imginit():void {
			// add images here
			// (further) images should be referenced by variable name
			img = Image.createRect(host.track.size, host.track.size, 0xC0C0C0);
			(graphic as Graphiclist).add(img);
		}
		
		override public function update():void {
			for each (var sc:Script in scripts) {
				sc.act();
			}
		}
	}
	
}