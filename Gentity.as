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
		public var angle:Number = 0.0; 
		public var dx:Number = 0.0; 
		public var dy:Number = 0.0;
		
		public function Gentity(_host:GenWorld, _x:Number=0.0, _y:Number=0.0) {
			host = _host; x = _x; y = _y;
			clear_images();
			init();
		}
		
		public function sizeinit():void {
			width = host.track.size; height = host.track.size;
		}
		
		public function init():void {
			typeinit();
			sizeinit();
			imginit();
			scriptinit();
		}
		
		public function typeinit():void {
			type = "entity";
		}
		
		public function clear_images():void {
			graphic = new Graphiclist();
		}
		
		public function add_rectimg(w:int, h:int, color:int):void {
			make_img(Image.createRect(w, h, color));
		}
		
		public function center(image:Image):void {
			image.centerOO();
			image.x = image.scaledWidth/2-(image.scaledWidth-width)/2; 
			image.y = image.scaledHeight/2-(image.scaledHeight-height)/2;
		}
		
		public function adjust_angle(image:Image):void {
			// FlashPunk's oddities I guess
			image.angle = -todeg(angle)-90;
		}
		
		public function make_img(image:Image):void {
			img = (graphic as Graphiclist).add(image) as Image;
			center(img);
		}
		
		public function imginit():void {
			// add images here
			// (further) images should be referenced by variable name
			add_rectimg(width, height, 0xC0C0C0);
		}
		
		public function scriptinit():void {
			// add scripts here
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
		
		public function dir(speed:Number):void {
			dx = Math.cos(angle)*speed; dy = Math.sin(angle)*speed;
		}
		
		public function torad(d:Number):Number {
			return d * Math.PI / 180.0;
		}
		public function todeg(d:Number):Number {
			return d * 180.0 / Math.PI;
		}
		
		public function oob():Boolean {
			return x<-width || x>host.track.scr_w || y<-height || y>host.track.scr_h;
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
		public function aim(target:Gentity):void {
			angle = Math.atan2(target.y-y, target.x-x);
			if (img) adjust_angle(img);
		}
		
		public function when(condition:Function, result:Function):ScriptTrigger {
			return add_script(new ScriptTrigger(condition, result)) as ScriptTrigger;
		}
		public function whenever(condition:Function, result:Function):ScriptTriggerRepeat {
			return add_script(new ScriptTriggerRepeat(condition, result)) as ScriptTriggerRepeat;
		}
		public function always(action:Function):ScriptAuto {
			return add_script(new ScriptAuto(action)) as ScriptAuto;
		}
		public function delay(frames:int, callback:Function):ScriptDelay {
			return add_script(new ScriptDelay(frames, callback)) as ScriptDelay;
		}
		public function repeat(frames:int, callback:Function):ScriptPeriodic {
			return add_script(new ScriptPeriodic(frames, callback)) as ScriptPeriodic;
		}
		public function write(_x:Number, _y:Number, msg:Function):GUIText {
			return host.add(new GUIText(host, _x, _y, msg)) as GUIText;
		}
		public function onclick(callback:Function):ScriptOnClick {
			return add_script(new ScriptOnClick(callback)) as ScriptOnClick;
		}
		public function onhover(callback:Function):ScriptOnHover {
			return add_script(new ScriptOnHover(callback)) as ScriptOnHover;
		}
		public function oncollision(_type:String, callback:Function):ScriptCollision {
			return add_script(new ScriptCollision(_type, callback)) as ScriptCollision;
		}
		
		public function has_script(sc:Script):Boolean {
			return scripts.indexOf(sc) != -1;
		}
		public function scriptcount(sc:Script):int {
			var out:int = 0;
			for each (var sc2:Script in scripts) {
				if (sc2 === sc) out++;
			}
			return out;
		}

		public function duplicate(_x:Number, _y:Number):void {
			host.add(new (Object(this).constructor)(host,_x,_y));
		}
		
		override public function update():void {
			for each (var sc:Script in scripts) {
				sc.used = false;
			}
			for each (sc in scripts) {
				if (sc.used) continue;
				sc.act();
				sc.used = true;
			}
		}
	}
	
}