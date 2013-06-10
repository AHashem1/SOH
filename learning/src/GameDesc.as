package
{
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.Screen;
	import feathers.controls.ScreenNavigatorItem;
	
	import starling.core.starling_internal;
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class GameDesc extends Screen
	{
		private var header:Header;
		private var label:Label;
		private var scorelabel:Label;
		private var backButton:Button;
		private var exitButton:Button;
		public static var score:int = 0;
		private static const GAME_NUMBERS:String = "Numbers";
		
		public function GameDesc()
		{
			
		}
		
		override protected function draw():void
		{
			header.width = actualWidth;
			label.y = header.height +20;
			label.x = 20;
		}
		
		override protected function initialize():void
		{
			
			header = new Header();
			header.title = "Basic_Count";
			addChild(header);
			
			backButton = new Button();
			backButton.label = "Back";
			backButton.addEventListener(starling.events.Event.TRIGGERED, onBack);
			
			// my new code
			scorelabel = new Label();
			scorelabel.text="Your Score : "+ score ;
			scorelabel.x= backButton.x + 115;
			scorelabel.y= backButton.y + 28;
			addChild(scorelabel);
			
			//exit Button
			exitButton = new Button();
			exitButton.label = "Exit";
			exitButton.addEventListener(starling.events.Event.TRIGGERED, onExit);
			
			header.leftItems = new <DisplayObject>[backButton];
			header.rightItems= new <DisplayObject>[exitButton];
			
			label = new Label();
			label.text = "ccc";
			addChild(label);
			
			Main1.nav.clearScreen();
			Main1.nav.showScreen(GAME_NUMBERS);
			
		}
		private function onBack(e:Event):void
		{
			
			dispatchEventWith("complete");
		}
		private function onExit(e:Event):void
		{
			dispatchEventWith("exit");
		}
	}
}