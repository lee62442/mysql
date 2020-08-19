// console.log('Hello, World!')

// for( var i = 0; i < 500; i++) {
// 	console.log('Hello, World!')
// }

// for( var i = 0; i < 500; i++) {
// 	// insert a new user into the database
// }

// Execute file with:
// node filename.js 

var faker = require('faker');

// console.log(faker.internet.email());

// console.log(faker.date.past());

// function generateAddress() {
// 	console.log(faker.address.streetAddress());
// 	console.log(faker.address.city());
// 	console.log(faker.address.state());
// }

// generateAddress();



var mysql = require('mysql');
 
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  database : 'join_us'
});


// // Using the MySQL Node Package:

// connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
//    if (error) throw error;
//    console.log('The solution is: ', results[0].solution);
// });
// connection.end();


// Another sample query, this time selecting 3 things:

// var q = 'SELECT CURTIME() as time, CURDATE() as date, NOW() as now';
// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results[0].time);
//   console.log(results[0].date.toString());
//   console.log(results[0].now.toString());
// });
// connection.end();

// INSERTING DATA TAKE 2
// var person = {
// 	email: faker.internet.email(),
// 	created_at: faker.date.past()
// };

// console.log(person)

// var end_result = connection.query('INSERT INTO users SET ?', person, function(err, result){
// 	if (err) throw err;
// 	console.log(result);
// });

// connection.end();


// console.log(faker.date.past());

// inseting lots of data ====================

var data = [];
for (var i = 0; i < 500; i++) {
	data.push([
		faker.internet.email(),
		faker.date.past()
	]);
}


// console.log(data);

var q = 'INSERT INTO users (email, created_at) VALUES ?';

connection.query(q, [data], function(err, result){
	console.log(err);
	console.log(result);
});

connection.end();








