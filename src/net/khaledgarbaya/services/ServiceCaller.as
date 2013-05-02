/**
 * VERSION: 0.2
 * DATE: 2012-01-01
 * AS3
 **/

package net.khaledgarbaya.services
{
	import flash.events.IOErrorEvent
	import flash.events.SecurityErrorEvent
	import flash.events.NetStatusEvent
	import flash.net.Responder
	import flash.net.NetConnection
	/**
	*
	*@author Khaled Garbaya contact@khaledgarbaya.net
	*/
	public class ServiceCaller
	{
		/** @private gate way path (eg: http://localhost/amphp/gateway.php) **/
		private var _gatewayPath:String;
		/** @private **/
		private var responder:Responder;
		/** @private  **/
		private var callBack:Function;
		/** @private **/
		private var netConnection:NetConnection;
		
		/**
		* Constructur
		* @param gatewayPath String the link to the gateway file in amfphp
		*/
		public function ServiceCaller(gatewayPath:String)
		{
			this.gatewayPath = gatewayPath;
			_initConnection();
		}
		/**
		* callMethod call methode already defined in the Service created 
		* (eg:ServiceName/method or ServiceName.method in amfphp)
		* @param methodeName String 
		* @param dataObj Object contained the datanication occures
		* @param callback Function to be called when the commu
		*/
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
		
		// Getters and Setters
		public function get gatewayPath():String
		{
			return _gatewayPath;
		}

		public function set gatewayPath(value:String):void
		{
			_gatewayPath = value;
		}
		
		/**
		* @private Init the Connection
		*/
		private function _initConnection():void
		{
			responder = new Responder(onResult, onFault);
			netConnection = new NetConnection();
			netConnection.addEventListener(IOErrorEvent.IO_ERROR, ioErrorEventHandler);
			netConnection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityErrorEventHandler);
			netConnection.addEventListener(NetStatusEvent.NET_STATUS, netStatusEventHandler);
		}
		
		//Handle Event
		private function ioErrorEventHandler(e:IOErrorEvent):void
		{
			//TODO : Handle Event
		}
		private  function securityErrorEventHandler(e:SecurityErrorEvent):void
		{
			//TODO : Handle Event
		}
		private function netStatusEventHandler(e:NetStatusEvent):void
		{
			trace("NET STATUS :" + e.info.code);
		}	
		
		// onResult and onFault Functions called bye the responder
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
