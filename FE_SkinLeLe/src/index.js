require("dotenv").config();
const express = require("express");
const app = express();
const port = process.env.PORT || 3000;
const cors = require("cors");
const cookieParser = require("cookie-parser");
const configViewEngine = require("./config/viewEngine");
const session = require("express-session");
const flash = require("express-flash");
const useRouter = require("./routes/user");
const adminRouter = require("./routes/admin");
app.use(
  session({
    secret: "keyboard cat",
    resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 60000 },
  })
);
app.use(flash());

configViewEngine(app);

app.use(express.static(__dirname + "/public"));

app.use(cors());

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(cookieParser());

app.use((req, res, next) => {
  if (!req.session.cart) {
    req.session.cart = [];
  }
  let carts = req.session.cart;
  let total = 0;
  let sum = 0;
  for (let i = 0; i < carts.length; i++) {
    sum = carts[i].price * carts[i].quantity;
    total += sum;
  }
  res.locals.cart = req.session.cart;
  res.locals.total = total;
  next();
});
app.use((req, res, next) => {
  if (
    !req.cookies.UserId ||
    !req.cookies.name ||
    !req.cookies.username ||
    !req.cookies.email ||
    !req.cookies.address
  ) {
    res.locals.UserId = "";
    res.locals.name = "";
    res.locals.username = "";
    res.locals.email = "";
    res.locals.address = "";
  }
  if (
    !req.cookies.adminUserId ||
    !req.cookies.adminname ||
    !req.cookies.adminusername ||
    !req.cookies.adminemail ||
    !req.cookies.adminaddress
  ) {
    res.locals.adminUserId = "";
    res.locals.adminname = "";
    res.locals.adminusername = "";
    res.locals.adminemail = "";
    res.locals.adminaddress = "";
  }
  res.locals.UserId = req.cookies.UserId;
  res.locals.name = req.cookies.name;
  res.locals.username = req.cookies.username;
  res.locals.email = req.cookies.email;
  res.locals.address = req.cookies.address;

  //admin
  res.locals.adminUserId = req.cookies.adminUserId;
  res.locals.adminname = req.cookies.adminname;
  res.locals.adminusername = req.cookies.adminusername;
  res.locals.adminemail = req.cookies.adminemail;
  res.locals.adminaddress = req.cookies.adminaddress;
  next();
});

app.use("/", useRouter);
app.use("/", adminRouter);
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
