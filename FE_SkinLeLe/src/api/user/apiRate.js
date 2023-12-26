const axios = require("axios");
const handleRate = async (req, res) => {
  let userId = req.cookies.UserId;
  let orderId = req.body.order_id;
  try {
    console.log("Data danh gia:", req.body);
    if (!req.body.star) {
      star = "";
    }
    if (!req.body.comment) {
      comment = "";
    }
    star = req.body.star;
    comment = req.body.comment;
    let date_rate = {
      product_id: req.body.product_id,
      user_id: req.body.user_id,
      order_id: req.body.order_id,
      comment: comment,
      star: star,
    };
    let data = await axios.post(process.env.BASE_URL + `rate`, date_rate);
    if (data.data.success === false) {
      req.flash("success", `${data.data.message}`);
    }
    return res.redirect(`/rateOrder/user=${userId}/order=${orderId}`);
  } catch (error) {
    console.log(error.response.data);
    if (error.response.data.detail) {
      req.flash("erro", `${error.response.data.detail}`);
    }
    return res.redirect(`/rateOrder/user=${userId}/order=${orderId}`);
  }
};

const productRate = (req, res) => {};

module.exports = {
  handleRate,
  productRate,
};
