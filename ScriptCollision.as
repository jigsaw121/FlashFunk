package 
{
	public class ScriptCollision extends ScriptAuto
	{
		public function ScriptCollision(colltype:String, result:Function):void {
			super(function():void {
				var hit:Gentity = target.collide(colltype, target.x, target.y);
				if (hit) result(hit);
			})
		}
		
		override public function init():void {
			type = "collision";
		}
	}
	
}