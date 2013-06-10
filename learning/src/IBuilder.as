package
{
	import flash.events.Event;
	
	import starling.events.Event;

	public interface IBuilder
	{
		function onBack(e:starling.events.Event):void;
		function onSubmit(e:starling.events.Event):void;
		function processXML(e:flash.events.Event):void ;
	}
}