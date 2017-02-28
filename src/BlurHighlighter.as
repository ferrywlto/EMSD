package
{
	import flash.display.BlendMode;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	import flash.filters.BlurFilter;

	public class BlurHighlighter
	{
		private var selectedObj:DisplayObject;
		private var agent:Sprite;
		private var glower:BlurFilter;
		private var _color:uint;
		private var _alpha:Number;
		
		public function BlurHighlighter(color:uint=0xFFFFFF, alpha:Number=0.5, blurX:Number=4, blurY:Number=4, quality:Number=1){
			SetStyle(color, alpha, blurX, blurY, quality);
		}
		public function SetStyle(color:uint=0xFFFFFF, alpha:Number=0.5, blurX:Number=4, blurY:Number=4, quality:Number=1):void{
			glower = new BlurFilter(blurX, blurY, quality);
			_color = color;
			_alpha = alpha;
		}
		public function SetGlowAgent(obj:Sprite):void{
			if(agent != null){
				agent.filters = [];
			}
			agent = obj;
			agent.blendMode = BlendMode.ADD;
		}
		public function StopGlow():void{
			if(agent != null){
				agent.filters = [];
				agent.graphics.clear();
			}
		}
		public function Glow(distObj:DisplayObject):void{
			if(agent != null && distObj != null){
				selectedObj = distObj;

				agent.graphics.clear();
				agent.graphics.lineStyle(5,_color,_alpha);
				agent.graphics.drawRect(0,0, selectedObj.width, selectedObj.height);

				var pt:Point = selectedObj.parent.localToGlobal(new Point(selectedObj.x, selectedObj.y));
				agent.x = pt.x;
				agent.y = pt.y;

				agent.filters = [glower];
				//trace(selectedObj+" X:"+selectedObj.x+" Y:"+selectedObj.y+" x:"+pt.x+" y:"+pt.y+" w:"+selectedObj.width+" h:"+selectedObj.height);
			}
		}
	}
}