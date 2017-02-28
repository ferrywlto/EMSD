package
{
	import flash.display.DisplayObject;

	public class CycleDisplayList
	{
		private var displayObjList:Vector.<DisplayObject>;
		private var current:DisplayObject;
		private var currIdx:uint;
		private var idxStrategy:Function;
		public function CycleDisplayList()
		{
			displayObjList = new Vector.<DisplayObject>();
			currIdx = 0;
		}
		public function get curIdx():uint{
			return currIdx;
		} 
		public function add(disObj:DisplayObject):void{
			displayObjList.push(disObj);
		}
		public function next():DisplayObject{
			idxStrategy = nextStrategy;
			return getItem();
		}
		public function prev():DisplayObject{
			idxStrategy = prevStrategy;
			return getItem();
		}
		private function nextStrategy():void
		{
			if(currIdx+1 < displayObjList.length)
				currIdx++;
			else
				currIdx = 0;
		}
		private function prevStrategy():void
		{
			if(currIdx-1 > -1)
				currIdx--;
			else
				currIdx = displayObjList.length-1;
		}
		private function getItem():DisplayObject{
			if(displayObjList!=null){
				if(current==null){
					current = displayObjList[0];
				}
				idxStrategy();
				current = displayObjList[currIdx];
			}
			return current;
		}
	}
}