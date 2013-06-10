package BasicCount
{
	import feathers.display.Sprite;
	
	import starling.events.Event;

	
	public class QuestionManager_BasicCount extends Sprite implements IManager
	{
		public static var score:Number=0;
		public static var repeated_times:int=0;
		private static const GAME_LIST:String = "gamesList";
		private static const GAME_NUMBERS:String = "Numbers";
		public function QuestionManager_BasicCount()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function  onAddedToStage (event:Event):void
		{
			drawScreen1();
			
		}
		
		private function drawScreen1():void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function checkscore (result:Boolean):void 
		{
			if(repeated_times < 9 )
			{
				repeated_times++;
				
				if (!result)
				{
					
					Main1.nav.clearScreen();
					Main1.nav.showScreen(GAME_NUMBERS);
				}
				else
				{
					score+=3;
					if(score==6)
					{
						score=0;
						Main1.nav.showScreen(GAME_LIST);	
					}
					else
					{
						Main1.nav.clearScreen();
						Main1.nav.showScreen(GAME_NUMBERS);
					}
				}
			}
			else
			{
				score=0;
				repeated_times=0;
				Main1.nav.showScreen(GAME_LIST);
			}
		}
		
	}
}