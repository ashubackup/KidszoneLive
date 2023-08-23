
var commentC=0;
function commentShow()
{
if(commentC==0){

	document.getElementById("cmdiv").style.display="none";
	commentC++;
	}

		else{
		document.getElementById("cmdiv").style.display="block";
		commentC=0;
		}   


}


