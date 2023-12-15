const apiProduct = require("../api/user/apiProduct");

const handleAddCart = async (req, res) => {
  let data = await apiProduct.getProductDetailCart(req.params.id);
  let name = data.data.name;
  let price_product = data.data.price;
  let sale = data.data.sale;
  let price = 0;
  if (sale > 0) {
    price = ((100 - sale) * price_product) / 100;
  } else {
    price = price_product;
  }

  let id = req.params.id;
  let image = data.data.image;
  let count = 0;
  for (let i = 0; i < req.session.cart.length; i++) {
    if (req.session.cart[i].id == id) {
      req.session.cart[i].quantity += 1;
      count++;
    }
  }
  if (count === 0) {
    cart_data = {
      id: id,
      name: name,
      price: price,
      image: image,
      quantity: 1,
    };
    req.session.cart.push(cart_data);
  }
  console.log(req.session.cart);
  const referer = req.headers.referer;
  const previousUrl = new URL(referer);
  const previousPath = previousUrl.pathname;
  // console.log("previousPath:", previousPath);
  return res.redirect(previousPath);
};

const deleteCart = (req, res) => {
  let productId = req.params.id;
  for (let i = 0; i < req.session.cart.length; i++) {
    if (req.session.cart[i].id === productId) {
      req.session.cart.splice(i, 1);
    }
  }
  return res.redirect("/viewCart");
};

const upCart = (req, res) => {
  let productId = req.params.id;
  for (let i = 0; i < req.session.cart.length; i++) {
    if (req.session.cart[i].id === productId) {
      req.session.cart[i].quantity++;
    }
  }
  return res.redirect("/viewCart");
};

const deCart = (req, res) => {
  let productId = req.params.id;
  for (let i = 0; i < req.session.cart.length; i++) {
    if (req.session.cart[i].id === productId) {
      req.session.cart[i].quantity--;
      if (req.session.cart[i].quantity === 0) {
        req.session.cart.splice(i, 1);
      }
    }
  }
  return res.redirect("/viewCart");
};

module.exports = {
  handleAddCart,
  deleteCart,
  upCart,
  deCart,
};
