<!--
//login.php
!-->

<?php

include('database_connection.php');

session_start();

$message = '';

if(isset($_SESSION['user_id']))
{
 header('location:index.php');
}

if(isset($_POST["login"]))
{
 $query = "
   SELECT * FROM login 
    WHERE username = :username
 ";
 $statement = $connect->prepare($query);
 $statement->execute(
    array(
      ':username' => $_POST["username"]
     )
  );
  $count = $statement->rowCount();
  if($count > 0)
 {
  $result = $statement->fetchAll();
    foreach($result as $row)
    {
      if(password_verify($_POST["password"], $row["password"]))
      {
        $_SESSION['user_id'] = $row['user_id'];
        $_SESSION['username'] = $row['username'];
        $sub_query = "
        INSERT INTO login_details 
        (user_id) 
        VALUES ('".$row['user_id']."')
        ";
        $statement = $connect->prepare($sub_query);
        $statement->execute();
        $_SESSION['login_details_id'] = $connect->lastInsertId();
        header("location:index.php");
      }
      else
      {
       $message = "<label>Wrong Password</label>";
      }
    }
 }
 else
 {
  $message = "<label>Wrong Username</labe>";
 }
}

?>

<html>  
    <head>  
        <title>Chat Application</title>  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
    </head>  
    <body>  
        <div class="container">
   <br />
   
   <h3 align="center">Login and Register</a></h3><br />
   <br />
   <div class="panel panel-default">
      <div class="panel-heading">Chat Login</div>
    <div class="panel-body">
     <form method="post">
      <p class="text-danger"><?php echo $message; ?></p>
      <div class="form-group">
       <label>Enter Username</label>
       <input type="text" name="username" class="form-control" required />
      </div>
      <div class="form-group">
       <label>Enter Password</label>
       <input type="password" name="password" class="form-control" required />
      </div>
      <div class="form-group">
       <input type="submit" name="login" class="btn btn-info" value="Login" />
      </div>
	  <div align="center">
		<button id="lisays">Register</button>
		</div>
     </form>
    </div>
   </div>
  </div>
  <div>
  <p style="display:none" id="tiedot"></p>
	
    <div id="lisaa" title="Register Username">
        <form id="lomake" name="lomake">
			Username: <input type="text" id="username" name="username"/><br>   
			Password: <input type="password" id="passwrd" name="passwrd"/><br>
        </form>
        <button id="save">Save</button>
        <button id="cancel">Cancel</button>
    </div>
    </body>  
</html>
<script>
$(function(){
		$("div#lisaa").dialog({
			width: 400,  
		});
		
		$("div#lisaa").dialog("close");
		$("button#lisays").click(() => {
			$("div#lisaa").dialog({
				show: "blind", duration: 0
			});
		})

			
		$("#cancel").click(() => {
				
				$("#lisaa").dialog("close");
			
			});

		$("#save").click(function(){
			var username=document.getElementById("username").innerHTML;
			var passwrd=document.getElementById("passwrd").innerHTML;
			if(username == null || passwrd == null)
			{
				window.alert("Username or password is missing");
			}
			else
			{
			var data = $("#lomake").serializeArray();
		   var result = true;
		   
		   $.post("http://localhost:3000/chat", data,(response) => {
				console.log(response);
				if ( response.status == "OK" )
				{
					console.log(passwrd);
					console.log(data);
					console.log("Kaikki ok");
				}
				else
				{
					console.log("Joku fiba: " + response.error);
					alert("Username or password is missing");
					result = false;
				}
				
			}).done(function(){
			
				if ( result )
				{
					$("#lisaa").dialog("close");
					window.alert("User added");
				}
				else
				{
					
				}
			})
			}
		});
			

	});
	
</script>
