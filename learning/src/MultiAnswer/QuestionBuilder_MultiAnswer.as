package MultiAnswer
{
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.Screen;
	import feathers.controls.TextInput;
	import feathers.core.ToggleGroup;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class QuestionBuilder_MultiAnswer extends Screen implements IBuilder
	{
		private var header:Header;
		private var label:Label= new Label();
		private var submitBtn:Button = new Button();
		private var right:Label= new Label();
		private var quest:Label= new Label();
		
		private var rightanswer:ToggleGroup = new ToggleGroup();
		
		public var Question:TextInput = new TextInput();
		public var answer1:TextInput = new TextInput();
		public var answer2:TextInput = new TextInput();
		public var answer3:TextInput = new TextInput();
		
		public var a1:Radio = new Radio();
		public var a2:Radio = new Radio();
		public var a3:Radio = new Radio();
		
		public var backButton:Button = new Button();
		public var createButton:Button = new Button();
		
		public var myXML:XML;
		private var loader2:URLLoader;
		
		private static const BL:String = "Blist";
		
		override protected function draw():void
		{
			header.width = actualWidth;
			label.y = header.height +10;
			label.x = 80;
		}
		
		override protected function initialize():void
		{
			header = new Header();
			header.title = "Multi_Answer Builder";
			addChild(header);
			
			quest.text = "Enter Question";
			quest.x = 50;
			quest.y = 60;
			this.addChild(quest);
			
			Question.text = "Question is";
			Question.width = 200;
			Question.x = 50;
			Question.y = 80;
			Question.setFocus();
			this.addChild(Question);
			
			answer1.text = "Answer #1 is ...";
			answer1.width = 150;
			answer1.x = 100;
			answer1.y = 140;
			answer1.setFocus();
			this.addChild(answer1);
			
			answer2.text = "Answer #2 is ...";
			answer2.width = 150;
			answer2.x = 100;
			answer2.y = 190;
			answer2.setFocus();
			this.addChild(answer2);
			
			answer3.text = "Answer #3 is ...";
			answer3.width = 150;
			answer3.x = 100;
			answer3.y = 240;
			answer3.setFocus();
			this.addChild(answer3);
			
			right.text = "The Right Answer is The ...";
			right.x = 150;
			right.y = 280;
			this.addChild(right);
			
			a1.label = "First";
			a1.x = 150;
			a1.y = 300;
			a1.toggleGroup = rightanswer;
			this.addChild(a1);
			
			a2.label = "Second";
			a2.x = 230;
			a2.y = 300;
			a2.toggleGroup = rightanswer;
			this.addChild(a2);
			
			a3.label = "Third";
			a3.x = 320;
			a3.y = 300;
			a3.toggleGroup = rightanswer;
			this.addChild(a3);
			
			submitBtn.label = "Submit";
			submitBtn.x = 100;
			submitBtn.y = 340;
			submitBtn.addEventListener(starling.events.Event.TRIGGERED, onSubmit);
			this.addChild(submitBtn);
			
			backButton.label = "Back";
			backButton.addEventListener(starling.events.Event.TRIGGERED, onBack);
			header.leftItems = new <DisplayObject>[backButton];
			
			var myLoader:URLLoader = new URLLoader();
			myLoader.load(new URLRequest("oman3d.xml"));
			myLoader.addEventListener(flash.events.Event.COMPLETE, processXML);
		}
		
		public function processXML(e:flash.events.Event):void 
		{
			loader2 = URLLoader(e.target);	
		}
		
		public function onBack(e:starling.events.Event):void
		{
			Main1.nav.showScreen(BL);
		}
		
		public function onSubmit(e:starling.events.Event):void
		{
			var selected:Radio = rightanswer.selectedItem as Radio;
			
			myXML = new XML(loader2.data);
			var lenght:Number=myXML.Questiontype[1].QuestionHeader.length();
			
			myXML.Questiontype[1].QuestionHeader[lenght]="";
			myXML.Questiontype[1].QuestionHeader[lenght].answer[0]=answer1.text;
			myXML.Questiontype[1].QuestionHeader[lenght].answer[1]=answer1.text;
			myXML.Questiontype[1].QuestionHeader[lenght].answer[2]=answer1.text;
			
			myXML.Questiontype[1].QuestionHeader[lenght].@Text=Question.text;
			
			if(selected==a1)
			{
				myXML.Questiontype[1].QuestionHeader[lenght].answer[0].@value="True";
				myXML.Questiontype[1].QuestionHeader[lenght].answer[1].@value="False";
				myXML.Questiontype[1].QuestionHeader[lenght].answer[2].@value="False";	
			}
			else if(selected==a2)
			{
				myXML.Questiontype[1].QuestionHeader[lenght].answer[0].@value="False";
				myXML.Questiontype[1].QuestionHeader[lenght].answer[1].@value="True";
				myXML.Questiontype[1].QuestionHeader[lenght].answer[2].@value="False";	
			}
			else if(selected==a3)
			{
				myXML.Questiontype[1].QuestionHeader[lenght].answer[0].@value="False";
				myXML.Questiontype[1].QuestionHeader[lenght].answer[1].@value="False";
				myXML.Questiontype[1].QuestionHeader[lenght].answer[2].@value="True";	
			} 
			
			var file:File = File.applicationStorageDirectory.resolvePath("data.xml");
			var fileStream:FileStream=new FileStream();
			fileStream.open(file, FileMode.APPEND);
			fileStream.writeObject(myXML.toString());
			fileStream.close();
			trace("Data Have Been Saved ");
			trace(file.nativePath);
		}
		
		public function QuestionBuilder_MultiAnswer()
		{
			super();
		}
	}
}