// ActionScript file
import flash.external.ExternalInterface; 
import flash.events.Event; 
function getTextFromJavaScript(str:String):void {  
	received_ti.text = "From JavaScript: " + str; 
} 
ExternalInterface.addCallback("sendTextToFlash", getTextFromJavaScript); 

function clickSend(event:Event):void {  
	var jsArgument:String = sending_ti.text;  
	var result:Object = ExternalInterface.call("getTextFromFlash", jsArgument);  
	received_ti.text = "Returned: " + result; 
} 

send_button.addEventListener("click", clickSend); 