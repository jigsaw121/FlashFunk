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
			scriptinit();
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
		
		public function scriptinit():void {			
		}
		
		public function add_script(sc:Script):Script {
			scripts.push(sc);
			sc.set_target(this);
			return sc;
		}
		
		public function remove_script(sc:Script):void {
			var i:int = scripts.indexOf(sc);
			if (i == -1) return;
			
			scripts.splice(i, 1);
		}
		
		public function remove_script_type(sct:String):void {
			for (var i:int = scripts.length-1; i>=0; i--) {
				if (scripts[i].type == sct) {
					scripts.splice(i, 1);
				}
			}
		}
		
		public function die():void {
			host.remove(this);
		}
		
		override public function update():void {
			for each (var sc:Script in scripts) {
				sc.act();
			}
		}
	}
	
}