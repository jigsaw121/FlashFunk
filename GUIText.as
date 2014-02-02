package 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;

	public class GUIText extends Gentity
	{
		// visualizes a text output by the msg function
		
		public function GUIText(_host:GenWorld, _x:Number, _y:Number, msg:Function):void {
			super(_host, _x, _y);
			always(function():void {
				(img as Text).text = msg();
			}).act();
			
			// all gui elements should have a low layer to be rendered last (on top)
			layer = -64;
			// and be independent of camera
			img.scrollX = img.scrollY = 0;
		}
		
		override public function typeinit():void {
			type = "guitext";
		}
		
		override public function center(image:Image):void {
			image.x = -(image as Text).width/2;
		}
		
		public function fontoptions(txt:Text):void {
			// override to change font options
		}
		
		override public function imginit():void {
			img = new Text("", 0, 0);
			fontoptions((img as Text));
			addGraphic(img);
		}
	}
	
}