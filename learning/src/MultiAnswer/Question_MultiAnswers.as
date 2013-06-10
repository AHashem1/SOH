package MultiAnswer
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import BasicCount.QuestionManager_BasicCount;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.Screen;
	import feathers.core.ToggleGroup;
	
	import starling.display.DisplayObject;
	import starling.events.Event;

	public class Question_MultiAnswers extends Screen implements IQuestion
	{
		
		private var header:Header;
		private var label:Label= new Label();
		private var scorelabel:Label;
		private var submitBtn:Button = new Button();
		private var trueValue:String;
		private var backButton:Button;
		
		
		private var group:ToggleGroup = new ToggleGroup();
		private var radio3:Radio = new Radio();
		private var radio2:Radio = new Radio();
		private var radio1:Radio = new Radio();
		
		private var myXML:XML;
		
		private static const GAME_LIST:String = "gamesList";
		
		private static var obj:QuestionManager_MultiAnswer=new QuestionManager_MultiAnswer();
		public function Question_MultiAnswers()
		{
			
		}
		override protected function draw():void
		{
			header.width = actualWidth;
			label.y = header.height +10;
			label.x = 80;
		}
		
		override protected function initialize():void
		{
			header = new Header();
			header.title = "Multi Answer";
			addChild(header);
			
			submitBtn.x= 180;
			submitBtn.y= 170;
			submitBtn.label = "Submit" ;
			this.addChild(submitBtn);
			submitBtn.addEventListener(starling.events.Event.TRIGGERED, onSubmit);
			
			backButton = new Button();
			backButton.label = "Back";
			backButton.addEventListener(starling.events.Event.TRIGGERED, onBack);
			header.leftItems = new <DisplayObject>[backButton];
			
			
			// my new code
			scorelabel = new Label();
			scorelabel.text="Your Score : "+ QuestionManager_MultiAnswer.score.toString();
			scorelabel.x= backButton.x + 115;
			scorelabel.y= backButton.y + 28;
			addChild(scorelabel);
			
			label.text = "Answer One ";
			addChild(label);
						
			//var radio1:Radio = new Radio();
			radio1.label = "One";
			radio1.toggleGroup = group;
			radio1.x=80;
			radio1.y=100;
			this.addChild( radio1 );
			
			radio2.label = "Two";
			radio2.toggleGroup = group;
			radio2.x=80;
			radio2.y=130;
			this.addChild( radio2 );
			
			radio3.label = "Three";
			radio3.toggleGroup = group;
			radio3.x=80;
			radio3.y=160;
			this.addChild( radio3 );
			
			var myLoader:URLLoader = new URLLoader();
			myLoader.load(new URLRequest("oman3d.xml"));
			myLoader.addEventListener(flash.events.Event.COMPLETE, processXML);
			
		}
		
		public function processXML(e:flash.events.Event):void 
		{
			myXML = new XML(e.target.data);
			
			var length:Number = myXML.Questiontype.length();
			for (var i:int=0;i<length;i++)
			{
				if (myXML.Questiontype[i].@TYPE=="Multi_Answer")
				{
					var ql:int = myXML.Questiontype[i].QuestionHeader.length();
					var QRN : int = randomRange(0,ql);
					label.text = myXML.Questiontype[i].QuestionHeader[QRN].@Text;
					radio1.label=myXML.Questiontype[i].QuestionHeader[QRN].answer[0];
					radio2.label=myXML.Questiontype[i].QuestionHeader[QRN].answer[1];
					radio3.label=myXML.Questiontype[i].QuestionHeader[QRN].answer[2];
					
					if(myXML.Questiontype[i].QuestionHeader[QRN].answer[0].@value=="True")
						trueValue=myXML.Questiontype[i].QuestionHeader[QRN].answer[0];
					else if(myXML.Questiontype[i].QuestionHeader[QRN].answer[1].@value=="True")
						trueValue=myXML.Questiontype[i].QuestionHeader[QRN].answer[1];
					else if(myXML.Questiontype[i].QuestionHeader[QRN].answer[2].@value=="True")
						trueValue=myXML.Questiontype[i].QuestionHeader[QRN].answer[2];
				}
			}
		}
		
		public function randomRange(max:Number, min:Number=1):Number
		{
			return Math.random() * (max - min) + min;
		}
		
		public function onSubmit(e:starling.events.Event):void
		{
			var selected:Radio = group.selectedItem as Radio;
			
			if(selected.label==trueValue)
				obj.checkscore(true);
			else
				obj.checkscore(false);
			
		}
		
		public function onBack(e:starling.events.Event):void
		{
			Main1.nav.showScreen(GAME_LIST);
		}
	}
}

