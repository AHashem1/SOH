package CheckBox
{	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import CheckBox.QuestionManager_CheckBox;
	
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.Screen;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class Question_CheckBox extends Screen implements IQuestion
	{
		private var header:Header;
		private var label:Label= new Label();
		private var scorelabel:Label;
		private var submitBtn:Button = new Button();
		private var backButton:Button;
		
		public var check1:Check = new Check();
		public var check2:Check =  new Check();
		public var check3:Check =new Check();
		
		public static var score:Number;
		public static var B:Boolean;
		
		
		private var questionTypeIndex:int;
		private var questionHeaderIndex:int;
		
		private var myXML:XML;
		
		private static const GAME_LIST:String = "gamesList";
		
		private static var obj:QuestionManager_CheckBox=new QuestionManager_CheckBox();
		
		override protected function draw():void
		{
			header.width = actualWidth;
			label.y = header.height +10;
			label.x = 80;
		}
		
		override protected function initialize():void
		{
			header = new Header();
			header.title = "CheckBox";
			addChild(header);
			
			//label.text = "Answer One ";
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
						
			check1.label = "a";
			check1.x = 100;
			check1.y= 100;
			this.addChild(check1);
			
			check2.label = "b";
			check2.x = 100;
			check2.y= 140;
			this.addChild(check2);
			
			check3.label = "c";
			check3.x = 100;
			check3.y= 180;
			this.addChild(check3);
		
			var myLoader:URLLoader = new URLLoader();
			myLoader.load(new URLRequest("oman3d.xml"));
			myLoader.addEventListener(flash.events.Event.COMPLETE, processXML);
		}
		
		public function processXML(e:flash.events.Event):void 
		{
			
			myXML = new XML(e.target.data);
			var length:Number = myXML.Questiontype.length();
			for ( var i:int=0;i<length;i++)
			{
				if (myXML.Questiontype[i].@TYPE=="CheckBox")
				{
					var ql:Number = myXML.Questiontype[i].QuestionHeader.length();
					var QRN:int= randomRange(0,ql);
					
					label.text = myXML.Questiontype[i].QuestionHeader[QRN].@Text;
					check1.label=myXML.Questiontype[i].QuestionHeader[QRN].answer[0];
					check2.label=myXML.Questiontype[i].QuestionHeader[QRN].answer[1];
					check3.label=myXML.Questiontype[i].QuestionHeader[QRN].answer[2];
					
					//trace(i.toString());
					//trace(QRN.toString());
					var s:String="sss";
					s=myXML.Questiontype[i].QuestionHeader[QRN].answer[0].@value;
					questionTypeIndex=i;
					questionHeaderIndex=QRN;
				}
			}
		}
		
		public function randomRange(max:Number, min:Number=1):Number
		{
			return Math.random() * (max - min) + min;
		}
		
		public function onBack(e:starling.events.Event):void
		{
			Main1.nav.showScreen(GAME_LIST);
		}
		
		public function onSubmit(e:starling.events.Event):void
		{
			var scoreB1:Boolean;
			var scoreB2:Boolean;
			var scoreB3:Boolean;
			score=0;
			if(check1.isSelected)
			{
				if(myXML.Questiontype[questionTypeIndex].QuestionHeader[questionHeaderIndex].answer[0].@value=="True")
				{
					score++;
					scoreB1 = true ;
				}
				else
				{
					scoreB1 =false;
				}
			}
			
			if(check2.isSelected)
			{
				if(myXML.Questiontype[questionTypeIndex].QuestionHeader[questionHeaderIndex].answer[1].@value=="True")
				{
					score++;
					scoreB2 =true;
				}
				else
				{
					scoreB2 =false;
				}
			}
			
			if(check3.isSelected)
			{
				if(myXML.Questiontype[questionTypeIndex].QuestionHeader[questionHeaderIndex].answer[2].@value=="True")
				{
					score++;
					scoreB3 = true;
				}
				else
				{
					scoreB3 = false;
				}
			}
			
			if(scoreB1 || scoreB2 || scoreB3)
			{
				B=true;
			}
			
			obj.checkscore(B);
		}
		
		public function Question_CheckBox()
		{
			super();
		}
	}
}