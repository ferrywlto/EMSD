package
{
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.text.engine.Kerning;
	import flash.ui.Keyboard;

	public class KeyboardCommander extends EventDispatcher
	{
		private static var self:KeyboardCommander;
		private var tmpFunc:Function;
		private var
			backspaceFunc:Function,
			escapeFunc:Function,
			spaceFunc:Function,
			uparrowFunc:Function,
			downarrowFunc:Function,
			leftarrowFunc:Function,
			rightarrowFunc:Function,
			enterFunc:Function,
			tabFunc:Function,
			plusFunc:Function,
			minusFunc:Function,
			charMFunc:Function,
			charHFunc:Function;
			
		public function KeyboardCommander(enforcer:kcSingletonEnforcer){}
		
		public static function getInstance():KeyboardCommander
		{
			if(self == null){
				self = new KeyboardCommander(new kcSingletonEnforcer());
			}
			return self;
		}
		
		public function H_onKeyDown(evt:KeyboardEvent):void{
			switch(evt.keyCode){
				case Keyboard.H:				tmpFunc = charHFunc; break;
				case Keyboard.M: 				tmpFunc = charMFunc; break;
				case Keyboard.UP: 				tmpFunc = uparrowFunc; break;
				case Keyboard.DOWN: 			tmpFunc = downarrowFunc; break;
				case Keyboard.RIGHT: 			tmpFunc = rightarrowFunc; break;
				case Keyboard.LEFT: 			tmpFunc = leftarrowFunc; break;
				case Keyboard.TAB: 				tmpFunc = tabFunc; break;
				case Keyboard.ENTER: 			tmpFunc = enterFunc; break;
				case Keyboard.SPACE: 			tmpFunc = spaceFunc; break;
				case Keyboard.ESCAPE: 			tmpFunc = escapeFunc; break;
				case Keyboard.BACKSPACE: 		tmpFunc = backspaceFunc; break;
				case Keyboard.NUMPAD_ADD: 		tmpFunc = plusFunc; break;
				case Keyboard.NUMPAD_SUBTRACT: 	tmpFunc = minusFunc; break;
				default: break;
			}
			if(tmpFunc != null)
				tmpFunc();
		}
		public function set charH(f:Function):void{ charHFunc = f; }
		public function set charM(f:Function):void{ charMFunc = f; }
		public function set tab(f:Function):void{ tabFunc = f; }
		public function set plus(f:Function):void{ plusFunc = f; }
		public function set minus(f:Function):void{ minusFunc = f; }
		public function set enter(f:Function):void{ enterFunc = f; }
		public function set escape(f:Function):void{ escapeFunc = f; }
		public function set space(f:Function):void{ spaceFunc = f; }
		public function set backspace(f:Function):void{ backspaceFunc = f; }
		public function set uparrow(f:Function):void{ uparrowFunc = f; }
		public function set downarrow(f:Function):void{ downarrowFunc = f; }
		public function set leftarrow(f:Function):void{ leftarrowFunc = f; }
		public function set rightarrow(f:Function):void{ rightarrowFunc = f; }
	}
}
internal class kcSingletonEnforcer{}