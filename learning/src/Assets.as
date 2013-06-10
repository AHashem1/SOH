package 
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	
	public class Assets
	{
		[Embed(source="../media/graphics/bgWelcome.jpg")]
		public static const BgWelcome:Class;
		
		[Embed(source="../media/graphics/welcome_title.png")]
		public static const WelcomeTitle:Class;
		
		[Embed(source="../media/graphics/black.jpg")]
		public static const BlackBG:Class;
		
		[Embed(source="../media/graphics/apple.png")]
		public static const Apple:Class;
		
		[Embed(source="../media/graphics/green.jpg")]
		public static const GBtn:Class;
		
		[Embed(source="../media/graphics/letters.png")]
		public static const LettersBtn:Class;
		
		[Embed(source="../media/graphics/welcome_playButton.png")]
		public static const WelcomePlayBtn:Class;
		
		[Embed(source="../media/graphics/welcome_exitButton.png")]
		public static const WelcomeExitBtn:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		public static function getTexture(name:String):Texture
		{
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
		
		
	}
}