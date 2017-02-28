package
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	public class XMLConfiguration
	{
		private static var file:File;
		private static var fileStream:FileStream = new FileStream();
		
		public static function loadConfigXML(path:String):XML{				
			fileStream.open(File.applicationDirectory.resolvePath(path), FileMode.READ);
			var configXML:XML = new XML(fileStream.readUTFBytes(fileStream.bytesAvailable));
			fileStream.close();
			return configXML;
		}
		public static function saveConfigXML(configXML:XML, path:String):void{
			fileStream.open(new File(path), FileMode.WRITE);
			fileStream.writeUTFBytes(configXML.toXMLString());
			fileStream.close();
		}
	}
}