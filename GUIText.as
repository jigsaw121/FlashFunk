package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;

	public class GUIText extends Gentity
	{
		// visualizes a text output by the msg function
		
		public function GUIText(_host:GenWorld, _x:int, _y:int, msg:Function):void {
			super(_host, _x, _y);
			var sc:Script = add_script(new ScriptAuto(function():void {
				(img as Text).text = msg();
			}));
			sc.act();
		}
		
		override public function center(image:Image):void {
			image.x = -(image as Text).width/2;
		}
		
		override public function imginit():void {
			img = new Text("", 0, 0);
			// font options here
			addGraphic(img);
		}
	}
	
}