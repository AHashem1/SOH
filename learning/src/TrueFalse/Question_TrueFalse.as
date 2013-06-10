package TrueFalse
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

	
	public class Question_TrueFalse extends Screen implements IQuestion
	{
		private var header:Header;
		private var label:Label= new Label();
		private var scorelabel:Label;
		private var submitBtn:Button = new Button();
		private var backButton:Button = new Button();
		
		private var group:ToggleGroup = new ToggleGroup();
		public var radio1:Radio = new Radio();
		public var radio2:Radio = new Radio();
		
		public static var i:int;
		public static var QRN:int;
		private var trueValue:String;
		
		private var myXML:XML;
		private static const GAME_LIST:String = "gamesList";		
		
		private static var obj:QuestionManager_TrueFasle=new QuestionManager_TrueFasle();
		override protected function draw():void
		{
			header.width = actualWidth;
			label.y = header.height +10;
			label.x = 80;
		}
		
		override protected function initialize():void
		{
			header = new Header();
			header.title = "True and False";
			addChild(header);
			
			addChild(label);
			
			submitBtn.label="Submit";
			submitBtn.x= 200;
			submitBtn.y = 220;
			submitBtn.addEventListener(starling.events.Event.TRIGGERED, onSubmit);
			this.addChild(submitBtn);
			
			backButton = new Button();
			backButton.label = "Back";
			backButton.addEventListener(starling.events.Event.TRIGGERED, onBack);
			header.leftItems = new <DisplayObject>[backButton];
			
			radio1.label = "True";
			radio1.x = 100;
			radio1.y= 100;
			radio1.toggleGroup = group;
			this.addChild(radio1);
			
			radio2.label = "False";
			radio2.x = 100;
			radio2.y= 140;
			radio2.toggleGroup = group;
			this.addChild(radio2);
			

			var myLoader:URLLoader = new URLLoader();
			myLoader.load(new URLRequest("oman3d.xml"));
			myLoader.addEventListener(flash.events.Event.COMPLETE, processXML);
		}
		
		public function processXML(e:flash.events.Event):void 
		{
			myXML = new XML(e.target.data);
			var length:Number = myXML.Questiontype.length();
			for ( i=0;i<length;i++)
			{
				if (myXML.Questiontype[i].@TYPE=="TrueFalse")
				{
					var questlength:Number = myXML.Questiontype[i].QuestionHeader.length();
					
					QRN = randomRange(0,questlength);
					label.text = myXML.Questiontype[i].QuestionHeader[QRN].@Text;
					trueValue=myXML.Questiontype[i].QuestionHeader[QRN].answer[0];
					
				}
			}
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
		
		public function randomRange(max:Number, min:Number=1):Number
		{
			return Math.random() * (max - min) + min;
		}
		
		public function Question_TrueFalse()
		{
			super();
		}
	}
}