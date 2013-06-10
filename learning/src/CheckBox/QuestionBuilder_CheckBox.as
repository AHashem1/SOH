package CheckBox
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
	
	public class QuestionBuilder_CheckBox extends Screen implements IBuilder
	{
		private var header:Header;
		private var label:Label= new Label();
		private var submitBtn:Button = new Button();
		
		private var a1:ToggleGroup = new ToggleGroup();
		private var a2:ToggleGroup = new ToggleGroup();
		private var a3:ToggleGroup = new ToggleGroup();
		
		public var Question:TextInput = new TextInput();
		
		public var answer1:TextInput = new TextInput();
		public var answer2:TextInput = new TextInput();
		public var answer3:TextInput = new TextInput();
		
		public var v1a1:Radio = new Radio();
		public var v2a1:Radio = new Radio();
		
		public var v1a2:Radio = new Radio();
		public var v2a2:Radio = new Radio();
		
		public var v1a3:Radio = new Radio();
		public var v2a3:Radio = new Radio();
		
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
			header.title = "Multi_Choice Builder";
			addChild(header);
			
			Question.text = "Question is ...";
			Question.width = 200;
			Question.x = 50;
			Question.y = 80;
			Question.setFocus();
			this.addChild(Question);
			
			answer1.text = "Answer #1 is ...";
			answer1.width = 150;
			answer1.x = 100;
			answer1.y = 200;
			answer1.setFocus();
			this.addChild(answer1);
			
			v1a1.label = "True";
			v1a1.x = 100;
			v1a1.y = 250;
			v1a1.toggleGroup = a1;
			this.addChild(v1a1);
			
			v2a1.label = "False";
			v2a1.x = 200;
			v2a1.y = 250;
			v2a1.toggleGroup = a1;
			this.addChild(v2a1);
			
			answer2.text = "Answer #2 is ...";
			answer2.width = 150;
			answer2.x = 100;
			answer2.y = 280;
			answer2.setFocus();
			this.addChild(answer2);
			
			v1a2.label = "True";
			v1a2.x = 100;
			v1a2.y = 330;
			v1a2.toggleGroup = a2;
			this.addChild(v1a2);
			
			v2a2.label = "False";
			v2a2.x = 200;
			v2a2.y = 330;
			v2a2.toggleGroup = a2;
			this.addChild(v2a2);
			
			answer3.text = "Answer #3 is ...";
			answer3.width = 150;
			answer3.x = 100;
			answer3.y = 360;
			answer3.setFocus();
			this.addChild(answer3);
			
			v1a3.label = "True";
			v1a3.x = 100;
			v1a3.y = 410;
			v1a3.toggleGroup = a3;
			this.addChild(v1a3);
			
			v2a3.label = "False";
			v2a3.x = 200;
			v2a3.y = 410;
			v2a3.toggleGroup = a3;
			this.addChild(v2a3);
			
			submitBtn.label = "Submit";
			submitBtn.x = 150;
			submitBtn.y = 460;
			submitBtn.addEventListener(starling.events.Event.TRIGGERED, onSubmit);
			this.addChild(submitBtn);
			
			backButton.label = "Back";
			backButton.addEventListener(starling.events.Event.TRIGGERED, onBack);
			header.leftItems = new <DisplayObject>[backButton];
			
			var myLoader:URLLoader = new URLLoader();
			myLoader.load(new URLRequest("oman3d.xml"));
			myLoader.addEventListener(flash.events.Event.COMPLETE, processXML);
			
		}
		
		public function onBack(e:starling.events.Event):void
		{
			Main1.nav.showScreen(BL);
		}
		public function processXML(e:flash.events.Event):void 
		{
			loader2 = URLLoader(e.target);	
		}
		
		public function onSubmit(e:starling.events.Event):void
		{
			myXML = new XML(loader2.data);
			var length:Number=myXML.Questiontype[2].QuestionHeader.length();
			
			myXML.Questiontype[2].QuestionHeader[length]=" ";
			myXML.Questiontype[2].QuestionHeader[length].answer[0]=answer1.text;
			myXML.Questiontype[2].QuestionHeader[length].answer[1]=answer2.text;
			myXML.Questiontype[2].QuestionHeader[length].answer[2]=answer3.text;
			myXML.Questiontype[2].QuestionHeader[length].@Text=Question.text;
			
			var selected1Value:Radio = a1.selectedItem as Radio;
			var selected2Value:Radio = a2.selectedItem as Radio;
			var selected3Value:Radio = a3.selectedItem as Radio;
			
			myXML.Questiontype[2].QuestionHeader[length].answer[0].@value=selected1Value.label;
			myXML.Questiontype[2].QuestionHeader[length].answer[1].@value=selected2Value.label;
			myXML.Questiontype[2].QuestionHeader[length].answer[2].@value=selected3Value.label;
			
			var file:File = File.applicationStorageDirectory.resolvePath("data.xml");
			var fileStream:FileStream=new FileStream();
			fileStream.open(file, FileMode.APPEND);
			fileStream.writeObject(myXML.toString());
			fileStream.close();
			trace("Data Have Been Saved ");
			trace(file.nativePath);
		}
		
		public function QuestionBuilder_CheckBox()
		{
			super();
		}
	}
}