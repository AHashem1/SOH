package Complete
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
	import feathers.controls.Slider;
	import feathers.controls.TextInput;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class QuestionBuilder_Complete extends Screen implements IBuilder
	{
		private var header:Header;
		private var label:Label= new Label();
		private var submitBtn:Button = new Button();
		private var backButton:Button = new Button();
		private var slider:Slider ;
		private var sliderlabel:Label;
		
		private var nophrases:int ;
		
		private var phrase0:TextInput = new TextInput();
		private var phrase1:TextInput = new TextInput();
		private var phrase2:TextInput = new TextInput();
		private var phrase3:TextInput = new TextInput();
		
		public var myXML:XML;
		private var loader2:URLLoader;
		
		private static const CQB:String = "CompleteQB";
		private static const BL:String = "Blist";

		
		public function QuestionBuilder_Complete()
		{
			super();
		}
		
		override protected function draw():void
		{
			header.width = actualWidth;
			label.y = header.height +20;
			label.x = 20;
			
			
			slider.y=header.height+20;	
			slider.x=label.width+100;
			
			
			sliderlabel.y=header.height+20;
			sliderlabel.x=slider.width+100;
		}
		
		override protected function initialize():void
		{
			header = new Header();
			header.title = "Complete Builder";
			addChild(header);
			
			submitBtn.x= 180;
			submitBtn.y= 400;
			submitBtn.label = "Submit" ;
			this.addChild(submitBtn);
			submitBtn.addEventListener(starling.events.Event.TRIGGERED, onSubmit);
			
			backButton.label = "Back";
			backButton.addEventListener(starling.events.Event.TRIGGERED, onBack);
			header.leftItems = new <DisplayObject>[backButton];
			
			sliderlabel = new Label();
			sliderlabel.text = "1";
			this.addChild(sliderlabel);
			
			slider= new Slider();
			slider.minimum = 1;
			slider.maximum = 3;
			slider.value = 1;
			slider.step = 1;
			slider.addEventListener( starling.events.Event.CHANGE, slider_changeHandler );
			this.addChild( slider );
			
			phrase0.text = "First Part is ...";
			phrase0.width = 300;
			phrase0.height = 40;
			phrase0.x = 30;
			phrase0.y = 150;
			phrase0.setFocus();
			this.addChild(phrase0);
			
			phrase1.text = "Second Part is ...";
			phrase1.width = 300;
			phrase1.height = 40;
			phrase1.x = 30;
			phrase1.y = 200;
			phrase1.setFocus();
			phrase1.visible=true;
			this.addChild(phrase1);
			
			phrase2.text = "Third Part is ...";
			phrase2.width = 300;
			phrase2.height = 40;
			phrase2.x = 30;
			phrase2.y = 250;
			phrase2.setFocus();
			phrase2.visible=false;
			this.addChild(phrase2);
			
			phrase3.text = "Forth Part is ...";
			phrase3.width = 300;
			phrase3.height = 40;
			phrase3.x = 30;
			phrase3.y = 300;
			phrase3.setFocus();
			phrase3.visible=false;
			this.addChild(phrase3);
			
			var myLoader:URLLoader = new URLLoader();
			myLoader.load(new URLRequest("oman3d.xml"));
			myLoader.addEventListener(flash.events.Event.COMPLETE, processXML);
			
		}
		
		public function onSubmit(e:starling.events.Event):void
		{
			myXML = new XML(loader2.data);
			var lenght:Number=myXML.Questiontype[4].QuestionHeader.length();
			
			myXML.Questiontype[4].QuestionHeader[lenght]=" ";
			myXML.Questiontype[4].QuestionHeader[lenght].@nop=nophrases;
			
			switch(nophrases)
			{
				case 1:
					myXML.Questiontype[4].QuestionHeader[lenght].answer[0]=phrase0.text;
					myXML.Questiontype[4].QuestionHeader[lenght].answer[1]=phrase1.text;
					break;
				case 2:
					myXML.Questiontype[4].QuestionHeader[lenght].answer[0]=phrase0.text;
					myXML.Questiontype[4].QuestionHeader[lenght].answer[1]=phrase1.text;
					myXML.Questiontype[4].QuestionHeader[lenght].answer[2]=phrase2.text;
					break;
				case 3:
					myXML.Questiontype[4].QuestionHeader[lenght].answer[0]=phrase0.text;
					myXML.Questiontype[4].QuestionHeader[lenght].answer[1]=phrase1.text;
					myXML.Questiontype[4].QuestionHeader[lenght].answer[2]=phrase2.text;
					myXML.Questiontype[4].QuestionHeader[lenght].answer[3]=phrase3.text;
					
					break;
			}
			
			var file:File = File.applicationStorageDirectory.resolvePath("data.xml");
			var fileStream:FileStream=new FileStream();
			fileStream.open(file, FileMode.APPEND);
			fileStream.writeObject(myXML.toString());
			fileStream.close();
			trace("Data Have Been Saved ");
			trace(file.nativePath);
		}
		
		public function processXML(e:flash.events.Event):void 
		{
			loader2 = URLLoader(e.target);	
		}
		
		public function onBack(e:starling.events.Event):void
		{
			Main1.nav.showScreen(BL);
		}
		
		private function slider_changeHandler( event:starling.events.Event ):void
		{
			var slider:Slider = Slider( event.currentTarget );
			sliderlabel.text=slider.value.toString();
			nophrases=slider.value;
			
			switch(nophrases)
			{
				case 1:
					phrase1.visible=true;
					phrase2.visible=false;
					phrase3.visible=false;
					break;
				case 2:
					phrase1.visible=true;
					phrase2.visible=true;
					phrase3.visible=false;
					break;
				case 3:
					phrase1.visible=true;
					phrase2.visible=true;
					phrase3.visible=true;
					break;
			}
		}
	}
}