package 
{
	public class ScriptCollision extends ScriptTriggerRepeat
	{
		public function ScriptCollision(colltype:String, result:Function):void {
			var hit:Gentity;
			super(function():Boolean {
				hit = target.collide(colltype, target.x, target.y) as Gentity;
				return hit!=null;
			},
			function():void {
				result(hit);
			});
		}
		
		override public function init():void {
			type = "collision";
		}
	}
	
}