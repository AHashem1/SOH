package Equation
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
	
	public class QuestionBuilder_Equation extends Screen implements IBuilder
	{
		private var header:Header;
		private var label:Label= new Label();
		private var submitBtn:Button = new Button();
		
		public var Category:TextInput = new TextInput();
		
		public var equation:TextInput = new TextInput();
		public var answer:TextInput = new TextInput();
		
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
			header.title = "Equation Builder";
			addChild(header);
			
			Category.text = "Question Category is ...";
			Category.width = 200;
			Category.x = 50;
			Category.y = 80;
			Category.setFocus();
			this.addChild(Category);
			
			equation.text = "Equation is ...";
			equation.width = 210;
			equation.x = 50;
			equation.y = 200;
			equation.setFocus();
			this.addChild(equation);
			
			answer.text = "Answer  is ...";
			answer.width = 200;
			answer.x = 310;
			answer.y = 200;
			answer.setFocus();
			this.addChild(answer);
			
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
		
		public function QuestionBuilder_Equation()
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
			var lenght:Number=myXML.Questiontype[7].QuestionHeader.length();
			
			var newcategory:Boolean=true;
			for(var i:int=0;i<lenght;i++)
			{
				if(myXML.Questiontype[7].QuestionHeader[i].@Text == Category.text)
				{
					trace(myXML.Questiontype[7].QuestionHeader[i].equation.length());
					var equationlength:Number=myXML.Questiontype[7].QuestionHeader[i].equation.length();
					myXML.Questiontype[7].QuestionHeader[i].equation[equationlength]="";
					myXML.Questiontype[7].QuestionHeader[i].equation[equationlength].answer[0]=answer.text;
					myXML.Questiontype[7].QuestionHeader[i].equation[equationlength].@form=equation.text;
					
					newcategory=false;
					
				}
				if(!newcategory)
					break;
			}
			
			
			if(newcategory)
			{	
				myXML.Questiontype[7].QuestionHeader[lenght]="";
				myXML.Questiontype[7].QuestionHeader[lenght].@Text=Category.text;
				myXML.Questiontype[7].QuestionHeader[lenght].equation[0]="";
				myXML.Questiontype[7].QuestionHeader[lenght].equation[0].answer[0]=answer.text;
				myXML.Questiontype[7].QuestionHeader[lenght].equation[0].@form=equation.text;	
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