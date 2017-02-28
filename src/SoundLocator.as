package
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class SoundLocator {
		
		private static var instance:SoundLocator;
		
		[Embed(source="../assets/00_startup.mp3")]
		private var s00:Class;
		private var snd_startup:Sound = new s00() as Sound;
		
		[Embed(source="../assets/01_navigate.mp3")]
		private var s01:Class;
		private var snd_navigate:Sound = new s01() as Sound;
		
		[Embed(source="../assets/02_select.mp3")]
		private var s02:Class;
		private var snd_select:Sound = new s02() as Sound;
		
		public function SoundLocator(slse:SoundLocatorSingletonEnforcer) : void {}
		
		public static function getInstance() : SoundLocator {
			if ( !instance ) instance = new SoundLocator(new SoundLocatorSingletonEnforcer());
			return instance;
		}
		
		public function play( st:String ) : void {
			switch( st ) {
				case "snd_startup":
					snd_startup.play();
					break;
				case "snd_navigate":
					snd_navigate.play();
					break;
				case "snd_select":
					snd_select.play();
					break;
			}
		}
		
		public function playStartUpSnd():void {snd_startup.play();};
		public function playNavigateSnd():void {snd_navigate.play();};
		public function playSelectSnd():void {snd_select.play();};
	}
}
internal class SoundLocatorSingletonEnforcer{}