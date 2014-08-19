package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Gentity extends Entity 
	{
		public var vars:Object = {};
		public var host:GenWorld;
		public var scripts:Array = [];
		public var state:State;
		public var img:Image = null;
		public var angle:Number = 0.0; 
		public var dx:Number = 0.0; 
		public var dy:Number = 0.0;
		public var ondeath:Function = function(g:Gentity):void { };
		
		public function Gentity(_host:GenWorld, _x:Number=0.0, _y:Number=0.0) {
			host = _host; x = _x; y = _y;
			state = new State(this);
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
			stateinit();
		}
		
		public function stateinit():void {
		}
		
		public function typeinit():void {
			type = "entity";
		}
		
		public function clear_images():void {
			graphic = new Graphiclist();
			img = null;
		}
		
		public function gfx():Graphiclist {
			return graphic as Graphiclist;
		}
		public function removeGraphic(image:Image):void {
			gfx().remove(image);
		}
		
		public function add_rectimg(w:int, h:int, color:int):void {
			make_img(rectimg(w, h, color));
		}
		public function rectimg(w:int, h:int, color:int):Image {
			return Image.createRect(w, h, color);
		}
		public function circimg(r:int, c:int):Image {
			return Image.createCircle(r, c);
		}
		public function imgcreate(data:*, offx:int, offy:int):Image {
			var image:Image = new Image(data);
			image.x = offx; image.y = offy;
			addGraphic(image);
			return image
		}
		public function txtcreate(msg:String, offx:Number, offy:Number, font:String, size:int=12):Text {
			var txt:Text = new Text(msg, offx, offy);
			txt.font = font;
			txt.x = offx; txt.y = offy;
			txt.size = size;
			//addGraphic(txt);
			return txt
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
			var added:Image = (graphic as Graphiclist).add(image) as Image;
			if (img == null) img = added;
			center(img);
		}
		
		public function imginit():void {
			// add images here
			// (further) images should be referenced by variable name
			add_rectimg(width, height, 0xe0e0e0);
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
		
		public function dir(_speed:Number):void {
			dx = Math.cos(angle)*_speed; dy = Math.sin(angle)*_speed;
		}
		
		public function hyp(side_a:Number, side_b:Number):Number {
			// 90deg triangle hypotenuse length
			return Math.sqrt(Math.pow(side_a, 2) + Math.pow(side_b, 2));
		}
		
		public function rgb(r:uint=0, g:uint=0, b:uint=0):uint {
			return FP.getColorRGB(r, g, b);
		}
		
		public function shout(msg:String):Function {
			return function():void {
				host.track.announce(msg);
			}
		}
		
		public function mvmtdecay(decay:Number):Function {
			return function():void {
				dx /= decay; dy /= decay;
			}
		}
		
		public function torad(d:Number):Number {
			return d * (Math.PI / 180.0);
		}
		public function todeg(d:Number):Number {
			return d * (180.0 / Math.PI);
		}
		
		public function oob():Boolean {
			return x<-width || x>host.track.scr_w || y<-height || y>host.track.scr_h;
		}
		
		public function spawn():void {
			host.add(this);
		}
		
		public function die():void {
			host.remove(this);
			ondeath(this);
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
		
		public function angleto(target:Gentity):Number {
			return Math.atan2((target.y+target.height/2)-(y+height/2), (target.x+target.width/2)-(x+width/2))
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
		public function until(condition:Function, action:Function):ScriptUntil {
			return add_script(new ScriptTrigger(condition, action)) as ScriptUntil;
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
		public function hilight():Boolean {
			return x-FP.camera.x <= Input.mouseX && Input.mouseX < (x-FP.camera.x + width) && y-FP.camera.y <= Input.mouseY && Input.mouseY < (y-FP.camera.y + height);
		}
		public function onclick(callback:Function):Script {
			return always(function():void { if (Input.mousePressed && hilight()) callback(); } )
		}
		public function onhover(callback:Function):Script {
			return always(function():void { if (hilight()) callback(); } )
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
		
		public function gfxadd(image:Image):Function {
			return function():Image {
				addGraphic(image);
				return image;
			}
		}
		public function gfxrem(image:Image):Function {
			return function():Image {
				(graphic as Graphiclist).remove(image);
				return image;
			}
		}
		
		public function fromstate(from:String, cond:Function, to:String):void { 
			state.fromstate(from, cond, to);
		}
		public function duringstate(stname:String, sc:Script):void { 
			state.duringstate(stname, sc);
		}
		public function onstate(stname:String, func:Function):void { 
			state.onstate(stname, func);
		}
		public function offstate(stname:String, func:Function):void { 
			state.offstate(stname, func);
		}
		public function tostate(stname:String):void {
			if (instate(stname)) trace("NOTE from " + this + ": re-entering state \"" + stname + "\"")
			state.tostate(stname);
		}
		public function stateswitch(stname:String):Function { 
			return function():void { tostate(stname); }
		}
		public function pause():void { host.track.pause(); active = true; }
		public function unpause():void { host.track.unpause() }
		
		public function tapped(keyid:String):Boolean {
			keyid = keyid.toUpperCase()
			if (!(keyid in Key)) return false; return Input.pressed(Key[keyid]);
		}public function held(keyid:String):Boolean {
			keyid = keyid.toUpperCase()
			if (!(keyid in Key)) return false; return Input.check(Key[keyid]);
		}
		public function checktap(keyid:String):Function {
			return function():Boolean { if (!(keyid in Key)) return false; return Input.pressed(Key[keyid.toUpperCase()]); }
		}
		public function checkhold(keyid:String):Function {
			return function():Boolean { if (!(keyid in Key)) return false; return Input.check(Key[keyid.toUpperCase()]); }
		}
		
		public function instate(which:String):Boolean {
			return state.state == which;
		}
		
		public function all(type:*):Array {
			if (type is Class) return host.allc(type);
			else if (type is String) return host.allt(type);
			return [];
		}

		public function every(obj_spec:*, action:*):void {
			// 'obj_spec' can be a Class, a type string, or a list of objects
			// 'action' can be the name of a method to call as a string, or a custom function taking one object for processing at a time
			var objlist:Array;
			if (obj_spec is Array) objlist = obj_spec;
			else if (obj_spec is Class) objlist = host.allc(obj_spec);
			else if (obj_spec is String) objlist = host.allt(obj_spec);
			
			var proc:Function;
			if (action is Function) proc = action;
			else if (action is String) proc = function(obj:*):void { obj[action](); };
			
			host.every(objlist, proc);
		}

		public function gt(a:*, b:*):Boolean { return a >= b; }
		public function lt(a:*, b:*):Boolean { return a <= b; }
		public function interp(objvar:String, goal:Number, sp:*):Script {
			// generic interpolation of a variable
			// sp can be a number or a function->number describing acceleration
			var acc:Function;
			if (sp is Number) acc = function():Number { return sp as Number; }
			else acc = sp as Function;
			var that:Gentity = this;
			
			// direction inferred from goal since acc's trajectory is unknown
			// cmp is a >= or <= function wrapper since ops can't be passed around
			var cmp:Function;
			if (goal > that[objvar]) cmp = gt; // moving towards higher, end when that[objvar] >= goal
			else cmp = lt; // moving towards lower (or equal), end when that[objvar] <= goal
			
			var sc:Script = always(function():void { 
				that[objvar] += acc(); 
				if (cmp(that[objvar], goal)) {
					that[objvar] = goal;
					sc.remove();
				}
			}); sc.type = "interp";
			
			return sc;
		}
		
		public function duplicate(_x:Number, _y:Number):void {
			host.add(new (Object(this).constructor)(host, _x, _y));
		}
		
		public final function idle():void {}
		
		public function getvar(varname:String):* {
			return this[varname];
		}
		public function setvar(varname:String, value:*):* {
			this[varname] = value;
			return this[varname];
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