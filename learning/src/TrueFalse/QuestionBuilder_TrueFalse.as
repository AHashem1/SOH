package TrueFalse
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
	
	//import starling.display.DisplayObject;
	//import starling.events.Event;
	
	public class QuestionBuilder_TrueFalse extends Screen implements IBuilder
	{
		private var header:Header;
		private var label:Label= new Label();
		private var submitBtn:Button = new Button();
		private var group:ToggleGroup = new ToggleGroup();
		public var Question:TextInput = new TextInput();
		public var a1:Radio = new Radio();
		public var a2:Radio = new Radio();
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
			header.title = "True and False Builder";
			addChild(header);
			
			Question.text = "Question is ...";
			Question.width = 200;
			Question.x = 50;
			Question.y = 80;
			Question.setFocus();
			this.addChild(Question);
			
			a1.label = "True";
			a1.x = 100;
			a1.y = 200;
			a1.toggleGroup = group;
			this.addChild(a1);
			
			a2.label = "False";
			a2.x = 200;
			a2.y = 200;
			a2.toggleGroup = group;
			this.addChild(a2);
			
			submitBtn.label = "Submit";
			submitBtn.x = 100;
			submitBtn.y = 250;
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
			var selected:Radio = group.selectedItem as Radio;
			myXML = new XML(loader2.data);
			var lenght:Number=myXML.Questiontype[3].QuestionHeader.length();
			
			myXML.Questiontype[3].QuestionHeader[lenght]=" ";
			myXML.Questiontype[3].QuestionHeader[lenght].answer[0]=selected.label;
			myXML.Questiontype[3].QuestionHeader[lenght].@Text=Question.text;
			
			
			
			var file:File = File.applicationStorageDirectory.resolvePath("data.xml");
			var fileStream:FileStream=new FileStream();
			fileStream.open(file, FileMode.APPEND);
			fileStream.writeObject(myXML.toString());
			fileStream.close();
			trace("Data Have Been Saved ");
			trace(file.nativePath);
		}
		
		public function QuestionBuilder_TrueFalse()
		{
			super();
		}
		
		
	}
}