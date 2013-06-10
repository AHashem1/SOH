package MultiAnswer
{
	
	import feathers.display.Sprite;

	public class QuestionManager_MultiAnswer extends Sprite implements IManager
	{
		public static var score:Number=0;
		public static var repeated_times:int=0;
		
		private static const GAME_LIST:String = "gamesList";
		private static const Muti_answer_String:String = "multi_Answers";
		
		public function QuestionManager_MultiAnswer()
		{
			
		}
		
		public function checkscore (result:Boolean):void 
		{
			if(repeated_times < 9 )
			{
				repeated_times++;
				
				if (!result)
				{
					
					Main1.nav.clearScreen();
					Main1.nav.showScreen(Muti_answer_String);
				}
				else
				{
					score+=3;
					if(score==6)
					{
						score=0;
						repeated_times=0;
						Main1.nav.showScreen(GAME_LIST);	
					}
					else
					{
						Main1.nav.clearScreen();
						Main1.nav.showScreen(Muti_answer_String);
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