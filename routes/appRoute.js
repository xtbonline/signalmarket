const express = require("express");

const router = express.Router();

router.route("/").get((req, res) => {
  res.render("index", { title: "Signal Market" });
});
router.route("/about").get((req, res) => {
  res.render("about", { title: "About - Signal Market" });
  // res.redirect("/")
});
router.route("/contact-us").get((req, res) => {
  res.render("contact", {
    title: "Contact us - Signal Market",
  });
});

module.exports = router;
