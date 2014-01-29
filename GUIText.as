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