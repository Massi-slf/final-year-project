const Product = require('../models/Product')

module.exports = {

createProduct : async (req, res) => {
    const newProduct = new Product(req.body)
    try {
        await newProduct.save();
        res.status(200).json("Product Created")

    }catch (error){
        res.status(500).json("failed to create product")


    }
},
getAllProducts : async (req, res) => {
    const newProduct = new Product(req.body)
    try {
       const prodcuts = await Product.find().sort({createdAt : -1})
        res.status(200).json(prodcuts)
    }catch (error){
        res.status(500).json("failed to get product")


    }
},
getProduct : async (req, res) => {
    try {
       const productId = await Product.findById(productId)
       const {__v , cratedAt, ...ProductData} = Product._doc;
       res.sattus(200).json(ProductData)
    }catch (error){
        res.status(500).json("failed to get product")


    }
},
searchProducts : async (req, res) => {
    try {
      const results = await Product.aggregate(
        [
            {
              $search: {
                index: "shoes",
                text: {
                  query: req.params.key,
                  path: {
                    wildcard: "*"
                  }
                }
              }
            }
          ]
      )
      res.status(200).json(results)
    }catch (error){
        res.status(500).json("failed to get product")


    }
},


}






