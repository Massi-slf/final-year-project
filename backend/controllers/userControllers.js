const User = require ('../models/User')



module.exports = {
    getUser : async(req, res) => {

        try {
            const user = await User.findById(req.user.id)
            const {password, __v,updateAt,createdAt,...userData} = user._doc;
            res.status(200).json(userData)
        } catch (error) {
            res.status(500).json(userData)
            
        }
    },
    delete : async(req, res) => {

        try {
            await User.findByIdAndDelete(req.user.id)
            res.status(200).json('user delet')
        } catch (error) {
            res.status(500).json(userData)
            
        }
    },



}