const express = require('express');

// tested for the webhooks
const app = express();

app.get('/home',(req,res)=>{
    res.json({message: 'OK'})
})

app.listen(3000, ()=>{
    console.log("Server is started")
})






