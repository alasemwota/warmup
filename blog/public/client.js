// JavaScript Document
//necessary to load only the one case 
$(document).ready(function() {
   showLoginPage();
 });



function showMessage(errcode)
{
	var msg = ""
	var msg_handler = document.getElementById("Login-msg")
	if(errcode == -1)
		msg = "Invalid username and password combination. Please try again."
	else if(errcode == -2)
		msg = "This user name already exists. Please try again."
	else if(errcode == -3)
		msg = "The user name should be non-empty and at most 128 characters long. Please try again." 
	else 
		msg = "The password should be at most 128 characters long. Please try again." 
		
	msg_handler.firstChild.nodeValue = msg	
	return 1;
	
	
}
function showWelcomePage(count, username)
{
	//var welcome_handler = document.getElementById("welcome-msg")
	$('#welcome-msg').html("Welcome "+username+"<br>You have logged in "+count+" times.")
	//$('#forms').hide()
	$('#Login-page').hide()
	//welcome_handler.innerHTML = msg
	$('#Welcome-page').show();
	
	
}
function showLoginPage()
{
	$('#Welcome-page').hide()
	var msg_handler = document.getElementById("Login-msg")
	msg_handler.firstChild.nodeValue = "Please enter your credentials below"	
	//$("Login-msg").update("Please enter your credentials below");
	//window.open("page/client.html","_self")
	$('#Login-page').show();
	//$('#forms').show();
	
}

function handleLogin()
{
	username = $("#login-username").val()
	password = $("#login-password").val()
	json_request("/users/login", { user: username, password: password }, function(data) { return handle_server_response(data, username); }, function(err) {alert('Request could not be completed'); });
	
	return false;
}
function handleAddUser()
{
	username = $('#login-username').val()
	password = $('#login-password').val()
	json_request("/users/add", { user: username, password: password }, function(data) { return handle_server_response(data, username); }, function(err) {alert('Request could not be completed'); });
	
	return false;
}


function handle_server_response(response, username)
{
	
	if(response.errCode < 0)
	{
		showMessage(response.errCode);
	}
	else if(response.errCode == 1)
	{
		
		showWelcomePage(response.count, username);	
	}
	return true;
	
}
//sending json
function json_request(page, dict, success, failure) {
    $.ajax({
        type: 'POST',
        url: page,
        data: JSON.stringify(dict),
        contentType: "application/json",
        dataType: "json",
        success: success,
        failure: failure
    });
}
