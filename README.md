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
LICENSE
-------
Simplified BSD License
======================

* Copyright 2013 [Khaled Garbaya](http://khaledgarbaya.net/) . All rights reserved.

* Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

   1. Redistributions of source code must retain the above copyright notice, this list of
      conditions and the following disclaimer.

   2. Redistributions in binary form must reproduce the above copyright notice, this list
      of conditions and the following disclaimer in the documentation and/or other materials
      provided with the distribution.

