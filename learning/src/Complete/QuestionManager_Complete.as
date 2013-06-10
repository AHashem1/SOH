package Complete
{
	public class QuestionManager_Complete implements IManager 
	{
		public static var score:Number=0;
		public static var repeated_times:int=0;
		
		private static const GAME_LIST:String = "gamesList";
		private static const checkbox:String = "checkbox";
		public function QuestionManager_Complete()
		{
		}
		
		public function checkscore (result:Boolean):void 
		{
			if (result)
			{
				if(repeated_times < 9 )
				{
					repeated_times++;
					
					score+=result;
					if(score>6)
					{
						score=0;
						repeated_times=0;
						Main1.nav.showScreen(GAME_LIST);	
					}
					else
					{
						Main1.nav.clearScreen();
						Main1.nav.showScreen(checkbox);
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
}