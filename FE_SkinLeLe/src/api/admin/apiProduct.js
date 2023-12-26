const axios = require("axios");
require("dotenv").config();
const getProductHome = async (req, res) => {
  try {
    //console.log("ssss:", process.env.BASE_URL + `products`)
    let currentPage = req.params.currentPage;
    let dataProducts = await axios.get(
      process.env.BASE_URL + `prodouct/limit/${currentPage}`
    );
    let countProducts = await axios.get(
      process.env.BASE_URL + `prodouct/count`
    );
    //console.log("Data:", countProducts.data.data);
    let products = dataProducts.data.products;

    return res.render("admin/productAdmin.ejs", {
      products: products,
      countProducts: countProducts.data.data,
    });
  } catch (error) {
    console.log(error);
  }
};
const getProductHome2 = async (req, res) => {
  try {
    //console.log("ssss:", process.env.BASE_URL + `products`)
    let dataProducts = await axios.get(
      process.env.BASE_URL + `prodouct/limit/1`
    );
    let countProducts = await axios.get(
      process.env.BASE_URL + `prodouct/count`
    );
    //console.log("Data:", countProducts.data.data);
    let products = dataProducts.data.products;
    //console.log("Data:", products);
    return res.render("admin/productAdmin.ejs", {
      products: products,
      countProducts: countProducts.data.data,
    });
  } catch (error) {
    console.log(error);
  }
};
const getProductHomeASC = async (req, res) => {
  try {
    //console.log("ssss:", process.env.BASE_URL + `products`)
    let dataProducts = await axios.get(
      process.env.BASE_URL + `prodouctasc/limit/1`
    );
    //let countProducts = dataProducts.data.length
    let countProducts = await axios.get(
      process.env.BASE_URL + `prodouct/count`
    );
    let products = dataProducts.data.products;
    //console.log("Data:", products);
    return res.render("admin/productAdmin.ejs", {
      products: products,
      countProducts: countProducts.data.data,
    });
  } catch (error) {
    console.log(error);
  }
};
const getProductHomeASCpage = async (req, res) => {
  try {
    //console.log("ssss:", process.env.BASE_URL + `products`)
    let currentPage = req.params.currentPage;
    let dataProducts = await axios.get(
      process.env.BASE_URL + `prodouctasc/limit/${currentPage}`
    );
    let countProducts = await axios.get(
      process.env.BASE_URL + `prodouct/count`
    );
    //console.log("Data:", countProducts.data.data);
    let products = dataProducts.data.products;

    return res.render("admin/productAdmin.ejs", {
      products: products,
      countProducts: countProducts.data.data,
    });
  } catch (error) {
    console.log(error);
  }
};
const getProductHomeDESC = async (req, res) => {
  try {
    //console.log("ssss:", process.env.BASE_URL + `products`)
    let dataProducts = await axios.get(
      process.env.BASE_URL + `prodouctdesc/limit/1`
    );
    //let countProducts = dataProducts.data.length
    let countProducts = await axios.get(
      process.env.BASE_URL + `prodouct/count`
    );
    let products = dataProducts.data.products;
    //console.log("Data:", products);
    return res.render("admin/productAdmin.ejs", {
      products: products,
      countProducts: countProducts.data.data,
    });
  } catch (error) {
    console.log(error);
  }
};
const getProductHomeSALE = async (req, res) => {
  try {
    //console.log("ssss:", process.env.BASE_URL + `products`)
    let dataProducts = await axios.get(
      process.env.BASE_URL + `prodouctsale/limit/1`
    );
    //let countProducts = dataProducts.data.length
    let products = dataProducts.data.products;
    console.log("Data:", dataProducts.data.sale_count);
    return res.render("admin/productAdmin.ejs", {
      products: products,
      countProducts: dataProducts.data.sale_count,
    });
  } catch (error) {
    console.log(error);
  }
};
const getProductHomeSALEpage = async (req, res) => {
  try {
    //console.log("ssss:", process.env.BASE_URL + `products`)
    let currentPage = req.params.currentPage;
    let dataProducts = await axios.get(
      process.env.BASE_URL + `prodouctsale/limit/${currentPage}`
    );

    //console.log("Data:", countProducts.data.data);
    let products = dataProducts.data.products;

    return res.render("admin/productAdmin.ejs", {
      products: products,
      countProducts: dataProducts.data.sale_count,
    });
  } catch (error) {
    console.log(error);
  }
};
const getProductHomeDESCpage = async (req, res) => {
  try {
    //console.log("ssss:", process.env.BASE_URL + `products`)
    let currentPage = req.params.currentPage;
    let dataProducts = await axios.get(
      process.env.BASE_URL + `prodouctdesc/limit/${currentPage}`
    );
    let countProducts = await axios.get(
      process.env.BASE_URL + `prodouct/count`
    );
    //console.log("Data:", countProducts.data.data);
    let products = dataProducts.data.products;

    return res.render("admin/productAdmin.ejs", {
      products: products,
      countProducts: countProducts.data.data,
    });
  } catch (error) {
    console.log(error);
  }
};
const getProductDetail = async (req, res) => {
  try {
    let id = req.params.id;
    let data = await axios.get(process.env.BASE_URL + `product/${id}`);
    let data2 = await axios.get(process.env.BASE_URL + `getAllCategories`);
    let data3 = await axios.get(process.env.BASE_URL + `getAllbrands`);
    let product = data.data.product;
    let categories = data2.data.categories;
    let brand = data3.data.brands;
    //console.log(categories)
    console.log(product.category_id);
    let err = req.flash("err");
    let success = req.flash("success");
    if (data.data.success !== false) {
      return res.render("admin/editProduct.ejs", {
        product,
        categories,
        brand,
        err,
        success,
      });
    }
  } catch (error) {
    console.log("Error:", error);
  }
};
const updateProduct = async (req, res) => {
  try {
    if (req.body.name == null) {
      req.flash("err", `Vui lòng nhập tên sản phẩm`);
      res.redirect(`/admin/product/edit/${req.body.id}`);
    }
    if (req.body.price == null) {
      req.flash("err", `Vui lòng nhập giá sản phẩm`);
      res.redirect(`/admin/product/edit/${req.body.id}`);
    }
    if (req.body.quantity == null) {
      req.flash("err", `Vui lòng nhập số lượng sản phẩm`);
      res.redirect(`/admin/product/edit/${req.body.id}`);
    }
    if (req.body.category_id == "chọn danh mục sản phẩm") {
      req.flash("err", `Vui lòng nhập danh mục sản phẩm`);
      res.redirect(`/admin/product/edit/${req.body.id}`);
    }
    if (req.body.brand_id == 0) {
      req.flash("err", `Vui lòng nhập brand`);
      res.redirect(`/admin/product/edit/${req.body.id}`);
    }
    if (req.body.expiry == null) {
      req.flash("err", `Vui lòng nhập năm hết hạn`);
      res.redirect(`/admin/product/edit/${req.body.id}`);
    }
    if (req.body.manufacture == "") {
      req.flash("err", `Vui lòng nhập ngày sản xuất`);
      res.redirect(`/admin/product/edit/${req.body.id}`);
    }
    if (req.body.sale == "") {
      req.flash("err", `Vui lòng nhập sale`);
      res.redirect(`/admin/product/edit/${req.body.id}`);
    }
    //console.log("ssss:", process.env.BASE_URL + `products`)

    // datasend = {
    //     body: req.body,
    //     //file: req.file,
    // };

    if (req.file != null) {
      req.body.image = "/images/products/" + req.file.originalname;
      console.log(req.file);
    } else {
      req.body.image = req.body.img;
    }

    console.log("Data:", req.body);
    let dataProducts = await axios.put(
      process.env.BASE_URL + `updateProduct/${req.body.id}`,
      req.body
    );
    //console.log("Data:", req.body);
    //console.log(dataProducts.data.product.id)

    if (dataProducts.data.success !== false) {
      req.flash("success", `${dataProducts.data.message}`);
      return res.render("success.ejs", {
        message: "sửa sản phẩm thành công",
        url: `/admin/product/edit/${dataProducts.data.product.id}`,
      });
    } else {
      req.flash("success", `${dataProducts.data.message}`);
      return res.render("success.ejs", {
        message: "sửa sản phẩm thất bại",
        url: `/admin/product/edit/${dataProducts.data.product.id}`,
      });
    }
  } catch (error) {
    console.log(error);
  }
};
const getProductByName = async (req, res) => {
  try {
    let name = req.body.name;
    if (name == "") {
      return res.render("success.ejs", {
        message: "vui lòng nhập tên sản phẩm",
        url: "/admin/product/",
      });
    } else {
      let data = await axios.get(
        process.env.BASE_URL + `productByNamePage/${name}/page/1`
      );
      if (data.data.success !== false) {
        let products = data.data.product;
        let data2 = await axios.get(
          process.env.BASE_URL + `productByName/${name}`
        );
        console.log("len", data2.data.product.length);
        console.log("a", name);
        //console.log("a", products.length);
        return res.render("admin/productAdmin.ejs", {
          products: products,
          nameSearch: name,
          countProducts: data2.data.product.length,
        });
      } else {
        return res.render("admin/productAdmin.ejs", {
          message: `không tìm thấy sản phẩm nào có tên: ${name}`,
          nameSearch: name,
        });
      }
    }
  } catch (error) {
    console.log("Error:", error);
  }
};
const getProductByNamePage = async (req, res) => {
  try {
    let name = req.params.name;
    let currentPage = req.params.currentPage;
    console.log(name);

    let data = await axios.get(
      process.env.BASE_URL + `productByNamePage/${name}/page/${currentPage}`
    );
    let data2 = await axios.get(process.env.BASE_URL + `productByName/${name}`);
    //console.log("len", data2);
    if (data.data.success !== false) {
      let products = data.data.product;

      console.log("a", name);
      console.log("a", products.length);
      return res.render("admin/productAdmin.ejs", {
        products: products,
        nameSearch: name,
        countProducts: data2.data.product.length,
      });
    } else {
      return res.render("admin/productAdmin.ejs", {
        message: `không tìm thấy sản phẩm nào có tên: ${name}`,
        nameSearch: name,
      });
    }
  } catch (error) {
    console.log("Error:", error);
  }
};
const deleteProduct = async (req, res) => {
  try {
    let id = req.params.id;
    console.log(id);
    let data = await axios.delete(process.env.BASE_URL + `deleteProduct/${id}`);
    if (data.data.success !== false) {
      return res.render("success.ejs", {
        message: "xóa sản phẩm thành công",
        url: "/admin/product/",
      });
    } else {
      return res.render("success.ejs", {
        message: "xóa sản phẩm thất bại",
        url: "/admin/product/",
      });
    }
  } catch (error) {
    console.log("Error:", error);
  }
};
const getCreateProduct = async (req, res) => {
  try {
    let data2 = await axios.get(process.env.BASE_URL + `getAllCategories`);
    let data = await axios.get(process.env.BASE_URL + `getAllbrands`);
    let categories = data2.data.categories;
    let brand = data.data.brands;
    //console.log(brand)
    if (data2.data.success !== false) {
      let err = req.flash("err");
      let success = req.flash("success");
      return res.render("admin/createProduct.ejs", {
        success,
        err,
        categories,
        brand,
      });
    }
  } catch (error) {
    console.log("Error:", error);
  }
};
const createProduct = async (req, res) => {
  try {
    if (req.file != null) {
      req.body.image = "/images/products/" + req.file.originalname;
      console.log(req.file);
    } else {
      req.flash("err", `Vui lòng nhập ảnh sản phẩm`);
      res.redirect("/admin/product/create");
    }
    if (req.body.name == null) {
      req.flash("err", `Vui lòng nhập tên sản phẩm`);
      res.redirect("/admin/product/create");
    }
    if (req.body.price == null) {
      req.flash("err", `Vui lòng nhập giá sản phẩm`);
      res.redirect("/admin/product/create");
    }
    if (req.body.quantity == null) {
      req.flash("err", `Vui lòng nhập số lượng sản phẩm`);
      res.redirect("/admin/product/create");
    }
    if (req.body.category_id == "chọn danh mục sản phẩm") {
      req.flash("err", `Vui lòng nhập danh mục sản phẩm`);
      res.redirect("/admin/product/create");
    }
    if (req.body.brand_id == 0) {
      req.flash("err", `Vui lòng nhập brand`);
      res.redirect("/admin/product/create");
    }
    if (req.body.expiry == null) {
      req.flash("err", `Vui lòng nhập năm hết hạn`);
      res.redirect("/admin/product/create");
    }
    if (req.body.manufacture == "") {
      req.flash("err", `Vui lòng nhập ngày sản xuất`);
      res.redirect("/admin/product/create");
    }
    console.log(req.body);
    let dataProducts = await axios.post(
      process.env.BASE_URL + `addProduct`,
      req.body
    );
    //console.log("Data create:", datasend);
    if (dataProducts.data.success !== false) {
      req.flash("success", `${dataProducts.data.message}`);
      res.redirect("/admin/product/create");
    } else {
      req.flash("err", `${dataProducts.data.message}`);
      res.redirect("/admin/product/create");
    }
  } catch (error) {
    console.log("loi tao san pham moi", error);
  }
};

const getProductEditSale = async (req, res) => {
  try {
    let id = req.params.id;
    let data = await axios.get(process.env.BASE_URL + `products/${id}`);
    console.log(data.data);
    return res.render("admin/updateSale.ejs", {
      product: data.data,
    });
  } catch (error) {
    console.log(error);
  }
};

const updateSaleProduct = async (req, res) => {
  try {
    let id = req.body.id;
    console.log(req.body);
    let data = await axios.put(
      process.env.BASE_URL + `updateSaleProduct/${id}`,
      req.body
    );
    console.log(data.data);
    return res.render("admin/updateSale.ejs", {
      product: data.data.product,
    });
  } catch (error) {
    console.log(error);
  }
};

module.exports = {
  getProductHome2,
  getProductHomeDESC,
  getProductHomeDESCpage,
  getProductHomeASC,
  getProductHomeASCpage,
  getProductHomeSALE,
  getProductHomeSALEpage,
  getProductByName,

  getProductHome,
  getProductDetail,
  updateProduct,
  deleteProduct,
  getProductByNamePage,
  getCreateProduct,
  createProduct,
  getProductEditSale,
  updateSaleProduct,
};
