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
		
		public function sizeinit():void {
			width = host.track.size; height = host.track.size;
		}
		
		public function init():void {
			// add scripts here
			typeinit();
			sizeinit();
			imginit();
			scriptinit();
		}
		
		public function typeinit():void {
			type = "entity";
		}
		
		public function add_rectimg(w:int, h:int, color:int):void {
			img = Image.createRect(w, h, color);
			(graphic as Graphiclist).add(img);
			center(img);
		}
		
		public function center(image:Image):void {
			image.centerOO();
			image.x = image.width/2; image.y = image.height/2;
		}
		
		public function imginit():void {
			// add images here
			// (further) images should be referenced by variable name
			add_rectimg(width, height, 0xC0C0C0);
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
		
		public function alignx(hit:Gentity):void {
			if (dx >= 0) x = hit.x - width;
			else if (dx < 0) x = hit.x + hit.width;
			
			dx = 0;
		}
		public function aligny(hit:Gentity):void {
			if (dy >= 0) y = hit.y - height;
			else if (dy < 0) y = hit.y + hit.height;
			
			dy = 0;
		}
		
		public function movex():void {
			x += dx;
		}
		public function movey():void {
			y += dy;
		}
		
		override public function update():void {
			for each (var sc:Script in scripts) {
				sc.act();
			}
		}
	}
	
}