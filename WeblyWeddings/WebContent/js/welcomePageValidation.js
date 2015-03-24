$(document).ready(
		function()
		{
			$('#newWeddingBtn').click(
					function(e)
					{
						var regExp = new RegExp("^[A-z]*$");	
						if(regExp.test($('#weddingName').val()))
						{
							regExp = new RegExp("^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$");
							if(regExp.test($('#brideEmail').val()))
							{
								regExp = new RegExp("^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$");
								if(regExp.test($('#bridegroomEmail').val()))
								{
									regExp = new RegExp("^[0-2][0-9][0-9][0-9]\-([0][0-9]|[1][1-2])\-([0-2][0-9]|[3][0-1])$");
									if(regExp.test($('#date').val()))
									{
										regExp = new RegExp("^([0-1][0-9]|[2][0-3])\:([0-5][0-9])$");
										if(regExp.test($('#time').val()))
										{
											regExp = new RegExp(/^[A-z]*$/);
											if(regExp.test($('#venue').val()))
											{
													if($('#e1Name').val()!=="")
														foo($('#e1Name').val(),$('#e1Date').val(),$('#e1Time').val(),$('#e1Venue').val());
														
													if($('#e2Name').val()!=="")
														foo($('#e2Name').val(),$('#e2Date').val(),$('#e2Time').val(),$('#e2Venue').val());
														
													if($('#e3Name').val()!=="")
														foo($('#e3Name').val(),$('#e3Date').val(),$('#e3Time').val(),$('#e3Venue').val());
												
												
											}
											else
												{
												alert("Check Venue here!");
												e.preventDefault();
												}
											
										}
										else
											{
											alert("Time id format not valid!");
											e.preventDefault();
											}
										
									}
									else
										{
										alert("Date format is not valid!");
										e.preventDefault();
										}
									
								}
								else
									{
									alert("Bridegroom email id format is not valid!");
									e.preventDefault();
									}
								
							}
							else
								{
								alert("Bride email id format is not valid!");
								e.preventDefault();
								}
						}
						else 
						{
							alert("Wedding Name error! Change name");
							e.preventDefault();
						}
					}
			);
			
		}
);
function foo(a,b,c,d)
{
	var regExp= new RegExp("^[A-z]*$");
	if(regExp.test(a))
		{
		regExp = new RegExp("^[0-2][0-9][0-9][0-9]\-([0][0-9]|[1][1-2])\-([0-2][0-9]|[3][0-1])$");
		if(regExp.test(b))
			{ 
			regExp = new RegExp("^([0-1][0-9]|[2][0-3])\:([0-5][0-9])$");
			if(regExp.test(c))
			{	regExp=new RegExp("^[A-z]*$");
				if(regExp.test(d))
				{
				
				
				}
				else
				{
				alert("Event Venue format is not correct!");
				e.preventDefault();
				}
			
			}
			else
			{
			alert("Event Time format is not correct!");
			e.preventDefault();
			}
			
			}
		else
			{
			alert("Event Date format is not correct!");
			e.preventDefault();
			}
		
		}
	else
		{
		alert("Event Name format is not correct!");
		e.preventDefault();
		}

}