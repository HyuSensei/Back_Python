const axios = require("axios");
require("dotenv").config();
const paypal = require("paypal-rest-sdk");
const { PAYPAL_MODE, PAYPAL_CLIENT_KEY, PAYPAL_SECRET_KEY } = process.env;

paypal.configure({
  mode: PAYPAL_MODE,
  client_id: PAYPAL_CLIENT_KEY,
  client_secret: PAYPAL_SECRET_KEY,
});
const order = async (req, res) => {
  try {
    let cart = req.session.cart;
    if (cart.length == 0) {
      req.flash("erro", `Vui lòng thêm sản phẩm vào giỏ hàng !`);
      return res.redirect("/viewCart");
    }
    if (
      !req.body.name ||
      !req.body.phone ||
      !req.body.method ||
      !req.body.address
    ) {
      req.flash("erro", `Vui lòng điền đầy đủ thông tin đặt hàng !`);
      return res.redirect("/viewCart");
    }
    let total = 0;
    for (let i = 0; i < cart.length; i++) {
      total += cart[i].price * cart[i].quantity;
    }
    const exchangeRateVNDtoUSD = 0.0000435;
    let totalInUSD = total * exchangeRateVNDtoUSD;
    totalInUSD = parseFloat(totalInUSD.toFixed(2));
    if (req.body.method == "onl") {
      const create_payment_json = {
        intent: "sale",
        payer: {
          payment_method: "paypal",
        },
        redirect_urls: {
          return_url: "http://localhost:8082/viewCart",
          cancel_url: "http://localhost:8082/viewCart?cancel_check=true",
        },
        transactions: [
          {
            item_list: {
              items: cart.map((item) => ({
                name: item.name,
                sku: item.id,
                price: totalInUSD,
                currency: "USD",
                quantity: item.quantity,
              })),
            },
            amount: {
              currency: "USD",
              total: totalInUSD,
            },
            description: "Thanh toán đơn hàng",
          },
        ],
      };
      paypal.payment.create(
        create_payment_json,
        async function (error, payment) {
          if (error) {
            throw error;
          } else {
            for (let i = 0; i < payment.links.length; i++) {
              if (payment.links[i].rel === "approval_url") {
                res.redirect(payment.links[i].href);
              }
            }
            const dataOrder = {
              user: req.body,
              cart: req.session.cart,
            };
            let data = await axios.post(
              process.env.BASE_URL + `order`,
              dataOrder
            );
            if (data.data.success == true) {
              req.session.cart = [];
              req.flash("success", `${data.data.message}`);
            }
          }
        }
      );
    }
    if (req.body.method == "off") {
      let dataOrder = {
        user: req.body,
        cart: req.session.cart,
      };
      console.log("Data:", dataOrder);
      let data = await axios.post(process.env.BASE_URL + `order`, dataOrder);
      console.log("res:", data);
      if (data.data.success == true) {
        req.session.cart = null;
        req.flash("success", `${data.data.message}`);
      }
      return res.redirect("/viewCart");
    }
  } catch (error) {
    console.log("Loi:", error.response.data.detail);
    if (error.response.data.detail) {
      req.flash("erro", `${error.response.data.detail}`);
    }
    return res.redirect("/viewCart");
  }
};

const getOrderConfirm = async (req, res) => {
  try {
    let UserId = req.params.UserId;
    let data = await axios.get(process.env.BASE_URL + `orderConfirm/${UserId}`);
    if (data.data.success !== false) {
      return res.render("user/order_wait.ejs", {
        orders: data.data.order,
        lastProduct: data.data.last_product,
      });
    }
  } catch (error) {
    console.log(error);
  }
};

const getOrderShip = async (req, res) => {
  try {
    let UserId = req.params.UserId;
    let data = await axios.get(process.env.BASE_URL + `orderShip/${UserId}`);
    if (data.data.success !== false) {
      return res.render("user/order_ship.ejs", {
        orders: data.data.order,
        lastProduct: data.data.last_product,
      });
    }
  } catch (error) {
    console.log(error);
  }
};

const getOrderComplete = async (req, res) => {
  try {
    let UserId = req.params.UserId;
    let data = await axios.get(
      process.env.BASE_URL + `orderComplete/${UserId}`
    );
    if (data.data.success !== false) {
      return res.render("user/order_complete.ejs", {
        orders: data.data.order,
        lastProduct: data.data.last_product,
        countCheck: data.data.check_rate,
      });
    }
  } catch (error) {
    console.log(error);
  }
};

const getOrderRate = async (req, res) => {
  try {
    let erro = req.flash("erro");
    let success = req.flash("success");
    let userId = req.params.userId;
    let orderId = req.params.orderId;
    let data = await axios.get(
      process.env.BASE_URL + `orderRate/${userId}/${orderId}`
    );
    if (data.data.success === true) {
      return res.render("user/rate.ejs", {
        orders: data.data.order,
        checkRated: data.data.get_rate,
        countCheck: data.data.count_check,
        erro,
        success,
      });
    }
  } catch (error) {
    console.log(error);
  }
};

const updateStatusOrder = async (req, res) => {
  try {
    let userId = req.cookies.UserId;
    let orderId = req.params.orderId;
    let data = await axios.get(
      process.env.BASE_URL + `updateStatusOrder/${orderId}`
    );
    if (data.data.success === true) {
      return res.redirect(`/orderShip/${userId}`);
    }
  } catch (error) {
    console.log(error);
  }
};
const handleCancelOrder = async (req, res) => {
  try {
    let userId = req.cookies.UserId;
    let orderId = req.params.order_id;
    let data = await axios.get(
      process.env.BASE_URL + `actionCancelOrder/${orderId}`
    );
    if (data.data.success === true) {
      return res.redirect(`/orderConfirm/${userId}`);
    }
  } catch (error) {
    console.log(error);
  }
};

const getOrderCancel = async (req, res) => {
  try {
    let UserId = req.params.id;
    let data = await axios.get(process.env.BASE_URL + `orderCancel/${UserId}`);
    if (data.data.success !== false) {
      return res.render("user/order_cancel.ejs", {
        orders: data.data.order,
        lastProduct: data.data.last_product,
      });
    }
  } catch (error) {
    console.log(error);
  }
};

module.exports = {
  order,
  getOrderConfirm,
  getOrderShip,
  getOrderComplete,
  getOrderRate,
  updateStatusOrder,
  handleCancelOrder,
  getOrderCancel,
};
