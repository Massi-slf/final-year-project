const mongoose = require ("mongoose");


const OrderSchema = new mongoose.Schema({
   userId : { type : String, required : true},
   customerId : {type : String, required : true},
   ProductId: {
    type : mongoose.Schema.Types.ObjectId,
    ref : "Product"
   },
   quantity : {type : String, required : true},
   subtotal : {type : String, required : true},
   delivery_status : {type : String, required : true, default:"pending"},
   payment_status : {type : String, required : true},
   total : {type : String, required : true},
   


},{timeseries:true});

module.exports= mongoose.model("Order",OrderSchema)



