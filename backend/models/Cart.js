const mongoose = require ("mongoose");


const CartSchema = new mongoose.Schema({
   userId: {type : String ,required : true},
   products : [{
    cartItem: {
        type : mongoose.Schema.Types.ObjectId,
        ref: "Products"
    },
   }]


},{timeseries:true});

module.exports= mongoose.model("Cart",CartSchema)



