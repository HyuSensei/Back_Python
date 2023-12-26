const axios = require("axios");
require("dotenv").config();

const getProductBrand = async (req, res) => {
  try {
    const page = req.query.page || 1;
    const params = {
      page,
      limit: 8,
    };
    const brands = await axios.get(process.env.BASE_URL + `brands`);
    let data = await axios.get(
      process.env.BASE_URL + `brands/${req.params.brand_id}`,
      { params }
    );
    console.log("Data:", data.data.products);
    return res.render("user/brand.ejs", {
      products: data.data.products,
      brand_id: data.data.brand_id,
      brands: brands.data.brands,
      total_page: data.data.total_page,
      current_page: data.data.current_page,
    });
  } catch (error) {
    console.log(error);
  }
};

const getBrand = async (req, res) => {
  try {
    const brands = await axios.get(process.env.BASE_URL + `brands`);
    return brands.data;
  } catch (error) {
    console.log(error);
  }
};

module.exports = {
  getProductBrand,
  getBrand,
};
