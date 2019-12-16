'use strict'

// Asenna ensin mysql driver 
// npm install mysql --save

var mysql = require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',  // HUOM! Älä käytä root:n tunnusta tuotantokoneella!!!!
  password : '',
  database : 'chat'
});

module.exports = 
{
   

	//Tehtävä 49
	//Tehtävä 50 kuva
	//Tehtävä 51c = Ilmottaa virheestä Consolessa
    create: function(req, res){
		
        console.log("Create = " + JSON.stringify(req.body));
		
		if ( req.body.username == "" || req.body.password == "" )
		{
          res.send({"status": "NOT OK", "error": "Jokin kenttä on tyhjä tai syötit vääränlaista dataa"}); 
		}
		else 
		{
			
			var sql = "INSERT INTO login(username, password) VALUES ('" + req.body.username + "', '" + req.body.password + "')";
			
			console.log("sql=" + sql);
			
			connection.query(sql, function(error, results, fields){
				if ( error ){
				  console.log("Error adding user: " + error);
				  res.send({"status": "Jokin kenttä on tyhjä tai syötit vääränlaista dataa", "error": error, "response": null}); 
				}
				else
				{					
				  res.send({"status": "OK", "error": ""}); 
				}
			});
		}
    }

  
 
}