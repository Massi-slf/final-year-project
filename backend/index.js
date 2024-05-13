const express = require('express')
const app = express()
const mongoose = require("mongoose")
const dotenv = require("dotenv");
const prodcutRoute = require('./routes/products')
const authRoute = require ('./routes/auth')
const userRoute = require ('./routes/users')
dotenv.config();
mongoose.connect(process.env.MONGO_URL).then(() => console.log("db connected")).catch((err) => console.log(err))

app.use(express.json({limit: '10mb'}));
app.use(express.urlencoded({limit: '10mb', extended : true}));

app.use('/api/products',prodcutRoute);
app.use('/api/',authRoute);
app.use('/api/users',userRoute);



