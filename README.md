#Service Caller 
##this Class will help you to deal with AMFPHP Connection

Code Sample:
------------
var serviceCaller:ServiceCaller = new ServiceCaller(gateway);
var params:Object = {firstParam:"Hello", secondParam:"World"};
serviceCaller.callMethod("ServiceName/methodName",params,callback)//amfphp 2.0
//serviceCaller.callMethod("ServiceName.methodName",params,callback)//amfphp 1.9

function callback(msg:String, result:Object):void
{

//result object

}

//**********************************************************************************************
// AMFPHP SIDE example 
<?php
class ServiceName{
  
	function methodName($data)
	{
		$firstParam = $data->firstParam;
		$secondParam =$data->secondParam;
		//do some stuff

		return $something
	}
}


?> 
LICENCE
-------
* this code is open source and feel free to use it modify , I will be glad to receive at mail from you first at  khaledgarbaya@gmail.com
* Feel Free to report any issue or bug I'll be glad to try to fix it for you
* Copyright  © [Khaled Garbaya](http://khaledgarbaya.net/)
