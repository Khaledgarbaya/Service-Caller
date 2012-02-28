package net.khaledgarbaya.services
{
	import flash.events.IOErrorEvent
	import flash.events.SecurityErrorEvent
	import flash.events.NetStatusEvent
	import flash.net.Responder
	import flash.net.NetConnection
	
	public class ServiceCaller
	{
		private var _gatewayPath:String;
		private var responder:Responder;
		private var callBack:Function;
		private var netConnection:NetConnection;
		
		public function ServiceCaller(gatewayPath:String)
		{
			this.gatewayPath = gatewayPath;
			_initConnection();
			//callBack = new Function();
		}
		
		public function callMethod(methodeName:String,dataObj:Object,callback:Function):void
		{
			netConnection.connect( this.gatewayPath );
			if(dataObj != null)
			{
				netConnection.call(methodeName,this.responder,dataObj);
			}
			else
			{
				netConnection.call(methodeName,this.responder);
			}
			callBack = callback;
		}
		
		public function get gatewayPath():String
		{
			return _gatewayPath;
		}

		public function set gatewayPath(value:String):void
		{
			_gatewayPath = value;
		}
		
		private function _initConnection():void
		{
			responder = new Responder(onResult, onFault);
			netConnection = new NetConnection();
			netConnection.addEventListener(IOErrorEvent.IO_ERROR, ioErrorEventHandler);
			netConnection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityErrorEventHandler);
			netConnection.addEventListener(NetStatusEvent.NET_STATUS, netStatusEventHandler);
			
			
		}
		
		private function ioErrorEventHandler(e:IOErrorEvent):void
		{
			
		}
		private  function securityErrorEventHandler(e:SecurityErrorEvent):void
		{
			
		}
		private function netStatusEventHandler(e:NetStatusEvent):void
		{
			trace("NET STATUS :" + e.info.code);
		}
		
		
		private function onResult(result:Object):void
		{	
			callBack.call(this,"sucess",result);
		}
		private function onFault(result:Object):void
		{
			callBack.call(this,"fault",result);			
		}
		
		
	}
}