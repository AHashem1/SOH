package Match
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
	import feathers.controls.Screen;
	import feathers.controls.TextInput;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class QuestionBuilder_Match extends Screen implements IBuilder
	{
		private var header:Header;
		private var label:Label= new Label();
		private var submitBtn:Button = new Button();
		
		public var Category:TextInput = new TextInput();
		
		public var phrase1:TextInput = new TextInput();
		public var phrase1a:TextInput = new TextInput();
		
		public var phrase2:TextInput = new TextInput();
		public var phrase2a:TextInput = new TextInput();
		
		public var phrase3:TextInput = new TextInput();
		public var phrase3a:TextInput = new TextInput();
		
		public var backButton:Button = new Button();
		
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
			header.title = "Match Builder";
			addChild(header);
			
			Category.text = "Question Category is ...";
			Category.width = 200;
			Category.x = 50;
			Category.y = 80;
			Category.setFocus();
			this.addChild(Category);
			
			phrase1.text = "Question #1 is ...";
			phrase1.width = 150;
			phrase1.x = 100;
			phrase1.y = 200;
			phrase1.setFocus();
			this.addChild(phrase1);
			
			phrase1a.text = "Answer #1 is ...";
			phrase1a.width = 150;
			phrase1a.x = 300;
			phrase1a.y = 200;
			phrase1a.setFocus();
			this.addChild(phrase1a);
			
			phrase2.text = "Question #2 is ...";
			phrase2.width = 150;
			phrase2.x = 100;
			phrase2.y = 280;
			phrase2.setFocus();
			this.addChild(phrase2);
			
			phrase2a.text = "Answer #2 is ...";
			phrase2a.width = 150;
			phrase2a.x = 300;
			phrase2a.y = 280;
			phrase2a.setFocus();
			this.addChild(phrase2a);
			
			phrase3.text = "Question #3 is ...";
			phrase3.width = 150;
			phrase3.x = 100;
			phrase3.y = 360;
			phrase3.setFocus();
			this.addChild(phrase3);
			
			phrase3a.text = "Answer #3 is ...";
			phrase3a.width = 150;
			phrase3a.x = 300;
			phrase3a.y = 360;
			phrase3a.setFocus();
			this.addChild(phrase3a);
			
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
		
		public function QuestionBuilder_Match()
		{
			super();
		}
		
		public function onBack(e:starling.events.Event):void
		{
			Main1.nav.showScreen(BL);
		}
		
		public function onSubmit(e:starling.events.Event):void
		{
			myXML = new XML(loader2.data);
			var lenght:Number=myXML.Questiontype[5].QuestionHeader.length();
			
			var newcategory:Boolean=true;
			var equationlength:Number=myXML.Questiontype[5].QuestionHeader[i].equation.length();
			for(var i:int=0;i<lenght;i++)
			{
				if(myXML.Questiontype[5].QuestionHeader[i].@Text == Category.text)
				{
					trace(myXML.Questiontype[5].QuestionHeader[i].equation.length());
					
					myXML.Questiontype[5].QuestionHeader[i].equation[equationlength]="";
					myXML.Questiontype[5].QuestionHeader[i].equation[equationlength].answer1[0]=phrase1a.text;
					myXML.Questiontype[5].QuestionHeader[i].equation[equationlength].@ans=phrase1a.text;
					myXML.Questiontype[5].QuestionHeader[i].equation[equationlength].@Text=phrase1.text;
					
					myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+1]="";
					myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+1].answer1[0]=phrase2a.text;
					myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+1].@ans=phrase2a.text;
					myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+1].@Text=phrase2.text;
					
					myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+2]="";
					myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+2].answer1[0]=phrase3a.text;
					myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+2].@ans=phrase3a.text;
					myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+2].@Text=phrase3.text;
					
					newcategory=false;
					
				}
				if(!newcategory)
					break;
			}
			
			
			if(newcategory)
			{	
				myXML.Questiontype[5].QuestionHeader[lenght]="";
				myXML.Questiontype[5].QuestionHeader[lenght].@Text=Category.text;
				
				myXML.Questiontype[5].QuestionHeader[i].equation[equationlength]="";
				myXML.Questiontype[5].QuestionHeader[i].equation[equationlength].answer1[0]=phrase1a.text;
				myXML.Questiontype[5].QuestionHeader[i].equation[equationlength].@ans=phrase1a.text;
				myXML.Questiontype[5].QuestionHeader[i].equation[equationlength].@Text=phrase1.text;
				
				myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+1]="";
				myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+1].answer1[0]=phrase2a.text;
				myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+1].@ans=phrase2a.text;
				myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+1].@Text=phrase2.text;
				
				myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+2]="";
				myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+2].answer1[0]=phrase3a.text;
				myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+2].@ans=phrase3a.text;
				myXML.Questiontype[5].QuestionHeader[i].equation[equationlength+2].@Text=phrase3.text;	
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
	}
}