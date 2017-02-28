package
{
	import mx.core.BitmapAsset;

	public class VideoContainerAssets
	{
		[Embed(source="../assets/volOpen.jpg")]
		private static var ClsAssetImgVolOpen:Class;
		
		[Embed(source="../assets/volMute.jpg")]
		private static var ClsAssetImgVolMute:Class;
		
		[Embed(source="../assets/vidStop.jpg")]
		private static var ClsAssetImgVidStop:Class;
		
		[Embed(source="../assets/vidPlay.jpg")]
		private static var ClsAssetImgVidPlay:Class;
		
		private static var self:VideoContainerAssets;
		
		public static var 
			BMPVidPlay:BitmapAsset,
			BMPVidStop:BitmapAsset,
			BMPVolOpen:BitmapAsset,
			BMPVolMute:BitmapAsset;
		
		public static function init():void{
			if(self == null){
				self = new VideoContainerAssets();
			}
		}
			
		public function VideoContainerAssets()
		{
			if(BMPVidPlay == null){
				BMPVidPlay = new ClsAssetImgVidPlay() as BitmapAsset;
			}
			if(BMPVidStop == null){
				BMPVidStop = new ClsAssetImgVidStop() as BitmapAsset;
			}
			if(BMPVolOpen == null){
				BMPVolOpen = new ClsAssetImgVolOpen() as BitmapAsset;
			}
			if(BMPVolMute == null){
				BMPVolMute = new ClsAssetImgVolMute() as BitmapAsset;
			}
		}
	}
}