const router = require("express").Router();

const {
  getCurrentPrice,
  GetAlerts,
  CreateAlert,
  clearAlerts,
  getCurrencies,
  removeAlert,
  editAlert,
} = require("../controller/main");

router.get("/prices", getCurrentPrice);

router.get("/alerts", GetAlerts);
router.post("/alert", CreateAlert);
router.get("/currencies", getCurrencies);
router.get("/crypto-pop-alert/:id", removeAlert);
router.post("/crypto-update-alert", editAlert);
router.get("/crypto-clear-alerts", clearAlerts);

router.get("/test", (req, res) => {
  return res.json({
    data: [
      {
        title: "Bitcoin",
        currency: "BTC",
        price: "36, 928.00",
        state: "-3",
        icon: "BTC.svg",
      },
      {
        title: "Etherium",
        currency: "ETH",
        price: "2, 928.00",
        state: "-6",
        icon: "ETH.svg",
      },
      {
        title: "Cardano",
        currency: "BTC",
        price: "1.24",
        state: "-3",
        icon: "CVC.svg",
      },
      {
        title: "Dogecoin",
        currency: "DOGE",
        price: "36, 928.00",
        state: "-3",
        icon: "DOGE.svg",
      },
      {
        currency: "BTC",
        price: "0.62",
        state: "-4",
        title: "Ripple",
        icon: "REP.svg",
      },
    ],
  });
});

module.exports = router;
