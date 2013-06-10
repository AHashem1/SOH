package
{
	import BasicCount.QuestionBuilder_BasicCount;
	import BasicCount.Question_BasicCount;
	
	import CheckBox.QuestionBuilder_CheckBox;
	import CheckBox.Question_CheckBox;
	
	import Choose.QuestionBuilder_Choose;
	import Choose.Question_Choose;
	
	import Complete.QuestionBuilder_Complete;
	import Complete.Question_Complete;
	
	import Equation.Question_Equation;
	import Equation.QuestionBuilder_Equation;
	
	import Match.QuestionBuilder_Match;
	import Match.Question_Match;
	
	import MultiAnswer.QuestionBuilder_MultiAnswer;
	import MultiAnswer.Question_MultiAnswers;
	
	import TrueFalse.QuestionBuilder_TrueFalse;
	import TrueFalse.Question_TrueFalse;
	
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	import feathers.themes.MetalWorksMobileTheme;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Main1 extends Sprite
	{
		private static const GAME_LIST:String = "gamesList";
		private static const GAME_DESC:String = "gamesDesc";
		private static const GAME_NUMBERS:String = "Numbers";
		private static const Muti_answer_String:String = "multi_Answers";
		private static const QuestionBuilderstring:String = "QuestionBuilder";
		private static const Checkbox:String = "checkbox";
		private static const Truefalse:String = "TrueFalse";
		private static const complete:String = "Complete";
		private static const TFQB:String = "TrueFalseQB";
		private static const MAQB:String = "MultiAnswerQB";
		private static const MCQB:String = "MultiChoiseQB";
		private static const BL:String = "Blist";
		private static const CQB:String = "CompleteQB";
		private static const MQ:String = "MatchQ";
		private static const MQB:String = "MatchQB";
		private static const ChooseQ:String = "ChooseQ";
		private static const ChooseQB:String = "ChooseQB";
		private static const EQ:String = "EquationQ";
		private static const EQB:String = "EquationQB";
		
		public static var nav:ScreenNavigator;
		
		public static var selectedItem:Object;
		
		public function Main1()
		{
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			var theme:MetalWorksMobileTheme = new MetalWorksMobileTheme(stage);
			
			
			nav = new ScreenNavigator();
			addChild(nav);
			
			
			
			var glist:ScreenNavigatorItem = new ScreenNavigatorItem(GameList, {listSelected : selected} ,null);
			nav.addScreen(GAME_LIST,glist);
			
			var desc:ScreenNavigatorItem = new ScreenNavigatorItem(GameDesc, {complete : GAME_LIST} ,null);
			nav.addScreen(GAME_DESC,desc);

			var lessonShow:ScreenNavigatorItem = new ScreenNavigatorItem(Question_BasicCount, {complete : GAME_LIST} ,null);
			nav.addScreen(GAME_NUMBERS,lessonShow);
			
			var MultiShow:ScreenNavigatorItem = new ScreenNavigatorItem(Question_MultiAnswers, {complete : GAME_LIST} ,null);
			nav.addScreen(Muti_answer_String,MultiShow);
			
			var builder:ScreenNavigatorItem = new ScreenNavigatorItem(QuestionBuilder_BasicCount, {complete:BL} ,null);
			nav.addScreen(QuestionBuilderstring,builder);
			
			var checkboxx : ScreenNavigatorItem = new ScreenNavigatorItem (Question_CheckBox, {complete:GAME_LIST} ,null);
			nav.addScreen(Checkbox,checkboxx);
			
			var comp : ScreenNavigatorItem = new ScreenNavigatorItem (Question_Complete, {complete:GAME_LIST} ,null);
			nav.addScreen(complete,comp);
			
			var MCbuilder:ScreenNavigatorItem = new ScreenNavigatorItem(QuestionBuilder_CheckBox, {complete:BL} ,null);
			nav.addScreen(MCQB,MCbuilder);
			
			var rwquest : ScreenNavigatorItem = new ScreenNavigatorItem (Question_TrueFalse, {complete:GAME_LIST} ,null);
			nav.addScreen(Truefalse,rwquest);
			
			var TFbuilder:ScreenNavigatorItem = new ScreenNavigatorItem(QuestionBuilder_TrueFalse, {complete:BL} ,null);
			nav.addScreen(TFQB,TFbuilder);
			
			var MAbuilder:ScreenNavigatorItem = new ScreenNavigatorItem(QuestionBuilder_MultiAnswer, {complete:BL} ,null);
			nav.addScreen(MAQB,MAbuilder);
			
			var matchquest : ScreenNavigatorItem = new ScreenNavigatorItem (Question_Match, {complete:GAME_LIST} ,null);
			nav.addScreen(MQ,matchquest);
			
			var mbuilder : ScreenNavigatorItem = new ScreenNavigatorItem (QuestionBuilder_Match, {complete:BL} ,null);
			nav.addScreen(MQB,mbuilder);
			
			var choosebuilder : ScreenNavigatorItem = new ScreenNavigatorItem (QuestionBuilder_Choose, {complete:BL} ,null);
			nav.addScreen(ChooseQB,choosebuilder);
			
			var Cbuilder2:ScreenNavigatorItem = new ScreenNavigatorItem(QuestionBuilder_Complete, null ,null);
			nav.addScreen(CQB,Cbuilder2);
			
			var builderlist:ScreenNavigatorItem = new ScreenNavigatorItem(BuilderList, {listSelected : selected1} ,null);
			nav.addScreen(BL,builderlist);
			
			var choosequest : ScreenNavigatorItem = new ScreenNavigatorItem (Question_Choose, {complete:GAME_LIST} ,null);
			nav.addScreen(ChooseQ,choosequest);
			
			var Equest : ScreenNavigatorItem = new ScreenNavigatorItem (Question_Equation, {complete:GAME_LIST} ,null);
			nav.addScreen(EQ,Equest);
			
			var Ebuilder:ScreenNavigatorItem = new ScreenNavigatorItem(QuestionBuilder_Equation, {complete:BL} ,null);
			nav.addScreen(EQB,Ebuilder);
			
			nav.showScreen(GAME_LIST);
			
			var transition:ScreenSlidingStackTransitionManager = new ScreenSlidingStackTransitionManager(nav);
			
		}
		
		private function selected(e:Event, si:Object):void
		{
			switch(si.name)
			{
				case "Count":
					nav.showScreen(GAME_NUMBERS);
					break;
				case "Multi_Answer":
					nav.showScreen(Muti_answer_String);
					break;
				case "Multi_Choice" :
					nav.showScreen(Checkbox);
					break;
				case "TrueFalse":
					nav.showScreen(Truefalse);
					break;
				case "Complete":
					nav.showScreen(complete);
					break;
				case "Match":
					nav.showScreen(MQ);
					break;
				case "Choose":
					nav.showScreen(ChooseQ);
					break;
				case "Equations":
					nav.showScreen(EQ);
					break;
			}
			
		}
		
		private function selected1(e:Event, si:Object):void
		{
			switch(si.name)
			{
				case "Count Builder":
					nav.showScreen(QuestionBuilderstring);
					break;
				case "Multi_Answer Builder":
					nav.showScreen(MAQB);
					break;
				case "Multi_Choice Builder" :
					nav.showScreen(MCQB);
					break;
				case "TrueFalse Builder":
					nav.showScreen(TFQB);
					break;
				case "Complete Builder":
					nav.showScreen(CQB);
					break;
				case "Match Builder":
					nav.showScreen(MQB);
					break;
				case "Choose Builder":
					nav.showScreen(ChooseQB);
					break;
				case "Equations Builder":
					nav.showScreen(EQB);
					break;
			}
			
		}
	}
}