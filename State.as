package 
{
	import flash.utils.Dictionary;
	public class State
	{
		public var state:String = null;

		public var on:Object = new Object();
		public var off:Object = new Object();
		
		public var host:Gentity;
		
		public function State(_host:Gentity):void {
			host = _host;
			
			// every Gentity automatically has an empty State as 'state'
			// panel behaviour
			
			// panel.state.nextstate("wait", checktap("C"), "shop")
			// panel.state.onstate("shop", pause)
			// panel.state.onstate("shop", buttonanim)
			
			/*function buttonanim():void {
				host.host.everya(buttons, function(b:Button):void { b.state.tostate("wait") } )
			}*/
			
			// panel.state.offstate("shop", unpause)
			// panel.state.nextstate("shop", checktap("C"), "wait")
			// panel.state.tostate("wait")
			
			// function move():void {
			//		var sc:Script = whenever(checktap("Right"), function():void {
			//			panel.button.tostate("wait")
			// 			panel.button = button.next()
			// 			panel.button.tostate("select")
			//		})
			//		sc.type = "shop";
			// }
			// panel.state.onstate("shop", move)

			// all buttons
			// button.state.onstate("select", select)
			// state.onstate("select", gfxadd(hilight))
			// state.offstate("select", gfxrem(hilight))
			
		}
		
		public function duringstate(stname:String, sc:Script):void {
			onstate(stname, sc.add);
			host.remove_script(sc);
			offstate(stname, sc.remove);
			offstate(stname, sc.reset);
		}
		
		public function onstate(stname:String, func:Function):void {
			if (!(stname in on)) on[stname] = [];
			
			on[stname].push(func);
		}
		
		public function offstate(stname:String, func:Function):void {
			if (!(stname in off)) off[stname] = [];
			
			off[stname].push(func);
		}
		
		public function fromstate(from:String, cond:Function, to:String):void {
			duringstate(from, host.when(cond, switchstate(to)));
		}
		
		public function switchstate(to:String):Function {
			return function():void { tostate(to); };
		}
		
		/*public function nextstate(from:String, cond:Function, to:String):void {
			onstate(from, trans(from, cond, to));
		}*/
				
		public function apply(f:Function):void {
			f();
		}
		
		public function tostate(stname:String):void {
			//if (state == null) { state = stname; return; }
			
			if (state in off) {
				host.host.everya(off[state], apply)
			}
			
			host.remove_script_type(state);
			
			state = stname;
			
			if (state in on) {
				//host.delay(1, function():void { host.host.everya(on[state], apply) } );
				host.host.everya(on[state], apply)
			}
		}
	}
	
}