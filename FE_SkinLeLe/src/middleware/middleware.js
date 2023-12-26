const apiAuth = require("../api/user/apiAuth");
const jwt = require("jsonwebtoken");
const axios = require("axios");
const apiCategory = require("../api/user/apiCategory");
const apiBrand = require("../api/user/apiBrand");

const checkAuth = async (req, res) => {
  let cookie = req.cookies;
  let erro = req.flash("erro");
  if (cookie && cookie.token) {
    let token = cookie.token;
    let check = await apiAuth.handleAuth(token);
    if (check.detail) {
      return res.render("user/login.ejs", { erro: erro });
    }
    if (check.success == true) {
      return res.redirect("/");
    }
  } else {
    return res.render("user/login.ejs", { erro: erro });
  }
};

const checkRequireLogin = async (req, res, next) => {
  let cookie = req.cookies;
  let erro = req.flash("erro");
  if (cookie && cookie.token) {
    let token = cookie.token;
    let check = await apiAuth.handleAuth(token);
    if (check.detail) {
      return res.render("user/login.ejs", { erro: erro });
    }
    if (check.success == true) {
      next();
    }
  } else {
    return res.render("user/login.ejs", { erro: erro });
  }
};
const checkPremission = async (req, res, next) => {
  try {
    //if (nonSercurePath.includes(req.path)) return next();
    let cookie = req.cookies;
    let token = cookie.jwtadmin;
    //console.log(token)
    if (!token) {
      return res.render("success.ejs", {
        message: "vui long dang nhap vào trang admin",
        url: "/loginAdmin",
      });
    }
    let decoded = verifyToken(token);
    console.log("decode", decoded);
    if (decoded == null) {
      return res.render("success.ejs", {
        message: "Bạn không có quyền truy cập trang Admin",
        url: "/loginAdmin",
      });
    }
    let idUser = decoded.user_id;

    let getUser = await axios.get(process.env.BASE_URL + `user/${idUser}`);
    console.log(getUser.data.user.role_id);
    if (getUser.data.user.role_id == 2) {
      next();
    } else {
      return res.render("success.ejs", {
        message: "Bạn không có quyền truy cập trang Admin",
        url: "/loginAdmin",
      });
    }
  } catch (error) {
    console.log(error);
  }
};
const verifyToken = (token) => {
  let decoded = null;
  let key = process.env.JWT_SECRET;
  let data = null;
  try {
    decoded = jwt.verify(token, key);
    data = decoded;
    console.log("a", decoded);
  } catch (error) {
    console.log(error);
  }
  return data;
};

const getAllCategory = async (req, res, next) => {
  let data = await apiCategory.getCategory();
  res.locals.category1 = data.category_skincare;
  res.locals.category2 = data.category_makeup;
  next();
};

const getAllBrand = async (req, res, next) => {
  let data = await apiBrand.getBrand();
  res.locals.brands = data.brands;
  next();
};

module.exports = {
  checkAuth,
  checkRequireLogin,
  checkPremission,
  getAllCategory,
  getAllBrand,
};
