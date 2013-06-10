package Equation
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import Equation.QuestionManager_Equation;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.Screen;
	import feathers.controls.TextInput;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class Question_Equation extends Screen implements IQuestion
	{
		
		private var header:Header;
		private var label:Label= new Label();
		private var submitBtn:Button = new Button();
		private var backButton:Button;
		
		private var answer0:TextInput = new TextInput();
				
		private var equation:Label = new Label();
		
		private var true1:String;
				
		private var myXML:XML;
		
		private static const GAME_LIST:String = "gamesList";
		
		private static var obj:QuestionManager_Equation=new QuestionManager_Equation();
		
		public function Question_Equation()
		{
			super();
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
			header.title = "Solve Equation";
			addChild(header);
			
			addChild(label);
			
			var myLoader:URLLoader = new URLLoader();
			myLoader.load(new URLRequest("oman3d.xml"));
			myLoader.addEventListener(flash.events.Event.COMPLETE, processXML);
			
			submitBtn.x= 180;
			submitBtn.y= 170;
			submitBtn.label = "Submit" ;
			this.addChild(submitBtn);
			submitBtn.addEventListener(starling.events.Event.TRIGGERED, onSubmit);
			
			backButton = new Button();
			backButton.label = "Back";
			backButton.addEventListener(starling.events.Event.TRIGGERED, onBack);
			header.leftItems = new <DisplayObject>[backButton];
			
			equation.text= "1 + 1 =";
			equation.width = 150;
			equation.x = 30;
			equation.y = 80;
			this.addChild(equation);
			
			answer0.text ="the answer is...";
			answer0.width = 200;
			answer0.x = 150;
			answer0.y = 100;
			answer0.setFocus();
			this.addChild(answer0);
		}
		
		public function onBack(e:starling.events.Event):void
		{
			Main1.nav.showScreen(GAME_LIST);
		}
		
		public function onSubmit(e:starling.events.Event):void
		{
			if (answer0.text == true1)
				obj.checkscore(true);
			else
				obj.checkscore(false);
		}
		
		public function processXML(e:flash.events.Event):void
		{
			myXML = new XML(e.target.data);
			var length:Number = myXML.Questiontype.length();
			for ( var i:int=0;i<length;i++)
			{
				if (myXML.Questiontype[i].@TYPE=="Equation")
				{
					var ql:Number = myXML.Questiontype[i].QuestionHeader.length();
					var QRN:int= randomRange(0,ql);
					var q2:Number = myXML.Questiontype[i].QuestionHeader[QRN].equation.length();
					var rn:int = randomRange (0,rn);
					
					equation.text = myXML.Questiontype[i].QuestionHeader[QRN].equation[rn].@form;
					true1 = myXML.Questiontype[i].QuestionHeader[QRN].equation[rn].answer[0];
				}
			}
		}
		
		public function randomRange(max:Number, min:Number=1):Number
		{
			return Math.random() * (max - min) + min;
		}
	}
}