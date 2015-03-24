$(document).ready(function()
{
	$("#signinBtn").click(function(e) {
		var emailRE = new RegExp("^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$");
			if(emailRE.test($("#email").val())) {
			}
			else {
				alert("Enter a valid Email");
				e.preventDefault();
			}
	});
	$('#signupBtn').click(
			function(e)
			{
				var regExp=new RegExp("^[a-zA-Z]*[ ][a-zA-Z]*$");
				if(regExp.test($('#name').val()))
					{
					regExp=new RegExp("^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$");
					if(regExp.test($('#email').val()))
						{
							if($('#confirmPassword').val()===$('#password').val())
							{
								
				
							}
						else
							{
							alert("Passwords don match!");
							e.preventDefault();
							
							}
			
						}
					else
						{
						alert("Enter email properly!");
						e.preventDefault();
						
						}
					}
				else
					{
					alert("Enter name properly!");
					e.preventDefault();
					}
				
			}
	);	
});





