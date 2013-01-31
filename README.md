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

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.



