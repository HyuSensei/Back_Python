const axios = require("axios");
require("dotenv").config();

const getCategorySkinCare = async (req, res) => {
  try {
    const page = req.query.page || 1;
    const params = {
      page,
      limit: 8,
    };
    let data_category = await axios.get(
      process.env.BASE_URL + `categories/${req.params.id}`,
      { params }
    );
    console.log("Data:", data_category.data.products);
    return res.render("user/category_skincare.ejs", {
      products: data_category.data.products,
      category_id: data_category.data.category_id,
      category_skincare: data_category.data.category_skincare,
      category_makeup: data_category.data.category_makeup,
      total_page: data_category.data.total_page,
      current_page: data_category.data.current_page,
    });
  } catch (error) {
    console.log(error);
  }
};

const getCategoryMakeUp = async (req, res) => {
  try {
    const page = req.query.page || 1;
    const params = {
      page,
      limit: 8,
    };
    let data_category = await axios.get(
      process.env.BASE_URL + `categories/${req.params.id}`,
      { params }
    );
    console.log("Data:", data_category.data.products);
    return res.render("user/category_makeup.ejs", {
      products: data_category.data.products,
      category_id: data_category.data.category_id,
      category_skincare: data_category.data.category_skincare,
      category_makeup: data_category.data.category_makeup,
      total_page: data_category.data.total_page,
      current_page: data_category.data.current_page,
    });
  } catch (error) {
    console.log(error);
  }
};

const getCategory = async (req, res) => {
  try {
    const categories = await axios.get(process.env.BASE_URL + `categories`);
    return categories.data;
  } catch (error) {
    console.log(error);
  }
};

module.exports = {
  getCategoryMakeUp,
  getCategorySkinCare,
  getCategory,
};
