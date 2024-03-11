import mysql from 'mysql'
const connection = mysql.createConnection({
    host: 'localhost',  // Change this to your MySQL host
    user: 'root',  // Change this to your MySQL username
    password: '',  // Change this to your MySQL password
    database: 'form_builder'  // Change this to your MySQL database name
})


export default connection

