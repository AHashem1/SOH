package
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import BasicCount.Question_BasicCount;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.List;
	import feathers.controls.Screen;
	import feathers.data.ListCollection;
	import feathers.skins.StandardIcons;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class GameList extends Screen
	{
		private var header:Header;
		private var list:List;
		private var loader:URLLoader;
		private var num:Question_BasicCount;
		public var createButton:Button;
		
		private static const BL:String = "Blist";
		
		public function GameList()
		{
		}
		
		override protected function draw():void
		{
			
			header.width = actualWidth;
			
			list.y = header.height;
			list.width = actualWidth;
			list.height = actualHeight - header.height;
		}
		
		override protected function initialize():void
		{
			
			header = new Header();
			header.title = "Games Names";
			
			
			createButton = new Button();
			createButton.label = "Create";
			createButton.addEventListener(starling.events.Event.TRIGGERED, onCreate);
			header.leftItems = new <DisplayObject>[createButton];
			
			
			addChild(header);
			
			
			loader = new URLLoader(new URLRequest("team.json"));
			loader.addEventListener(flash.events.Event.COMPLETE, done);
			list = new List();
			addChild(list);
		}
		
		private function onCreate():void
		{
			// TODO Auto Generated method stub
			Main1.nav.showScreen(BL);
		}
		
		protected function done (event:flash.events.Event):void
		{
			var obj:Object = JSON.parse(loader.data);
			list.dataProvider = new ListCollection(obj.games);
			list.itemRendererProperties.labelField = "name";
			list.itemRendererProperties.accessoryTextureFunction = function(item:Object):Texture{
				return StandardIcons.listDrillDownAccessoryTexture;
			}
			list.addEventListener(starling.events.Event.CHANGE, listChanged);
		}
		
		private function listChanged(e:starling.events.Event):void
		{	
			dispatchEventWith("listSelected", false, list.selectedItem);	
		}
		
	}
}