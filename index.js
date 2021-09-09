const express = require('express')
const mysql = require('mysql');
const app = express()

app.post('/getData', async (req, res) => { 
    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "@Sistemas2021",
        database: "university"
    });
    console.log(req.query.query)
    var query = req.query.query
    con.connect((err) =>{
        if (err) throw err;
    })
    con.query(query, (err, result, fields) =>{
        if (err) throw err;
        console.log(result);
        res.send(result)
    })
    con.end()
})  

app.listen(2000, () => {
    console.log(`Example app listening at http://localhost:2000`)
})
