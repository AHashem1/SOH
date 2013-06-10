package Complete
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.Screen;
	import feathers.controls.TextInput;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class Question_Complete extends Screen implements IQuestion
	{
		private var header:Header;
		private var label:Label= new Label();
		private var submitBtn:Button = new Button();
		private var backButton:Button;
		
		public static var L:String;
		public static var G:int = 2;
		
		private var answer0:TextInput = new TextInput();
		private var answer1:TextInput = new TextInput();
		private var answer2:TextInput = new TextInput();
		
		private var phrase0:Label = new Label();
		private var phrase1:Label = new Label();
		private var phrase2:Label = new Label();
		private var phrase3:Label = new Label();
		
		private var myXML:XML;
		
		private static const GAME_LIST:String = "gamesList";
		
		public function Question_Complete()
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
			header.title = "Complete";
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
			
		}
		
		public function onSubmit(e:starling.events.Event):void
		{
			
		}
		
		public function onBack(e:starling.events.Event):void
		{
			Main1.nav.showScreen(GAME_LIST);
		}
		
		public function processXML(e:flash.events.Event):void 
		{
			
			myXML = new XML(e.target.data);
			var length:Number = myXML.Questiontype.length();
			for ( var i:int=0;i<length;i++)
			{
				if (myXML.Questiontype[i].@TYPE=="Complete")
				{
					var ql:Number = myXML.Questiontype[i].QuestionHeader.length();
					var QRN:int= randomRange(0,ql);
					
					var q2:Number = myXML.Questiontype[i].QuestionHeader[QRN].QuestionC.length();
					var randph:int = randomRange(0,q2);
					L =  myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].@nop;
					trace (myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].@nop);
					trace(L);
					switch (L)
					{
						case "2":
							//trace ("2");
							phrase0.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[0];
							phrase0.x = 30;
							phrase0.y = 80;
							this.addChild(phrase0);
							
							answer0.text =".............";
							answer0.width = 80;
							answer0.x = 150;
							answer0.y = 80;
							answer0.setFocus();
							this.addChild(answer0);
							
							phrase1.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[1];
							phrase1.x = 240;
							phrase1.y = 80;
							this.addChild(phrase1);
							break;
						case "3":
							//trace ("3");
							phrase0.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[0];
							phrase0.x = 30;
							phrase0.y = 80;
							this.addChild(phrase0);
							
							answer0.text =".............";
							answer0.width = 80;
							answer0.x = 150;
							answer0.y = 80;
							answer0.setFocus();
							this.addChild(answer0);
							
							phrase1.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[1];
							phrase1.x = 240;
							phrase1.y = 80;
							this.addChild(phrase1);
							
							answer1.text =".............";
							answer1.width = 80;
							answer1.x = 340;
							answer1.y = 75;
							answer1.setFocus();
							this.addChild(answer1);
							
							phrase2.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[2];
							phrase2.x = 430;
							phrase2.y = 80;
							this.addChild(phrase2);
							
							break;
						case "4":
							//trace ("4");
							phrase0.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[0];
							phrase0.x = 30;
							phrase0.y = 80;
							this.addChild(phrase0);
							
							answer0.text =".............";
							answer0.width = 80;
							answer0.x = 150;
							answer0.y = 75;
							answer0.setFocus();
							this.addChild(answer0);
							
							phrase1.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[1];
							phrase1.x = 250;
							phrase1.y = 80;
							this.addChild(phrase1);
							
							answer1.text =".............";
							answer1.width = 80;
							answer1.x = 340;
							answer1.y = 75;
							answer1.setFocus();
							this.addChild(answer1);
							
							phrase2.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[2];
							phrase2.x = 430;
							phrase2.y = 80;
							this.addChild(phrase2);
							
							answer2.text =".............";
							answer2.width = 80;
							answer2.x = 30;
							answer2.y = 125;
							answer2.setFocus();
							this.addChild(answer2);
							
							phrase3.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[3];
							phrase3.x = 140;
							phrase3.y = 125;
							this.addChild(phrase3);
							
							break;
					}
				}
			}
		}
		
		public function randomRange(max:Number, min:Number=1):Number
		{
			return Math.random() * (max - min) + min;
		}
		
	}
}