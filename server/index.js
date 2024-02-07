const express = require("express");
const mongoose = require("mongoose");
const authRouter=require('./routes/auth')
const cors=require('cors');

const PORT=process.env.PORT || 3000;

const app=express();

app.use(express.json());

app.use(cors());

app.use(authRouter);

const DB='mongodb+srv://ragul:1819@cluster0.mzrks4y.mongodb.net/';

mongoose.connect(DB).then(()=>{
    console.log('DB Connected');
}).catch((e)=>{
    console.log(e);
}); 



app.listen(PORT,'0.0.0.0',()=>{
    console.log(`connected at port ${PORT}`);
})
