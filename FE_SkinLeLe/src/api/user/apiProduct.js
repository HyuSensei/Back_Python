const axios = require("axios");
require("dotenv").config();
const getProductHome = async (req, res) => {
  try {
    let dataProductSale = await axios.get(
      process.env.BASE_URL + `products/sale`
    );
    let dataProductTop = await axios.get(
      process.env.BASE_URL + `products/order_top`
    );
    let dataProductSr = await axios.get(process.env.BASE_URL + `products`);
    let product_sale = dataProductSale.data.product;
    let product_sr = dataProductSr.data.product_sr;
    let product_top = dataProductTop.data.products;
    return res.render("user/home.ejs", {
      product_sales: product_sale,
      product_sr: product_sr,
      product_top: product_top,
    });
  } catch (error) {
    console.log(error);
  }
};

const getProductDetailCart = async (id) => {
  try {
    let data = await axios.get(process.env.BASE_URL + `products/${id}`);
    return data;
  } catch (error) {
    console.log(error);
  }
};

const getProductSearch = async (req, res) => {
  try {
    const product_name = req.query.product_name;
    const url = process.env.BASE_URL + `products/search/${product_name}`;
    const page = req.query.page || 1;
    const params = {
      page,
      limit: 8,
    };
    let data = await axios.get(url, { params });
    let products = data.data.products;
    return res.render("user/search.ejs", {
      product_name: product_name,
      products: products,
      total_page: data.data.total_page,
      current_page: data.data.current_page,
    });
  } catch (error) {
    console.log(error);
  }
};

const getProductSearchPage = async (req, res) => {
  try {
    const product_name = req.query.product_name;
    const url = process.env.BASE_URL + `products/search/${product_name}`;
    const params = {
      page: 1,
      limit: 8,
    };
    let data = await axios.get(url, { params });
    let products = data.data.products;
    return res.render("user/search.ejs", {
      products: products,
      total_page: data.data.total_page,
      current_page: data.data.current_page,
    });
  } catch (error) {
    console.log(error);
  }
};

const getProductDetail = async (req, res) => {
  try {
    let id = req.params.id;
    let data = await axios.get(process.env.BASE_URL + `products/detail/${id}`);
    let product = data.data.product;
    let rate = data.data.rate;
    let count_rate = data.data.count_rate;
    let count_star = data.data.count_star;
    if (data.data.success !== false) {
      return res.render("user/product_detail.ejs", {
        product: product,
        rate: rate,
        countRate: count_rate,
        countStar: count_star,
      });
    }
  } catch (error) {
    console.log("Error:", error);
  }
};

module.exports = {
  getProductHome,
  getProductDetailCart,
  getProductDetail,
  getProductSearch,
  getProductSearchPage,
};
