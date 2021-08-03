const { currentPrice, errorObject, fetchCurrencies } = require("../helpers");
const { createAlert, getAlerts, clearOrUpdate } = require("./alerts");
const crypto = require("crypto");

exports.getCurrentPrice = async (req, res) => {
  try {
    let prices = await currentPrice();
    if (prices.error) return res.status(500).json(errorObject);

    const {
      market_price_usd,
      market_cap_usd,
      market_dominance_percentage,
      average_transaction_fee_usd_24h,
      median_transaction_fee_usd_24h,
      circulation,
      blocks_24h,
      transactions_24h,
      inflation_24h,
    } = prices.data.data;

    return res.status(200).json({
      success: true,
      price_data: {
        circulation,
        blocks_24h,
        transactions_24h,
        inflation_24h,
        market_price_usd,
        market_cap_usd,
        market_dominance_percentage,
        average_transaction_fee_usd_24h,
        median_transaction_fee_usd_24h,
      },
    });
  } catch (error) {
    return res.status(500).json(errorObject);
  }
};

exports.CreateAlert = async (req, res) => {
  try {
    const { asset, margin, phone } = req.body;

    if (!asset || !margin || !phone)
      //Check whether all the fields are passed
      return res.status(400).json({
        error: true,
        message: "Please provide the required fields",
      });

    if (asset.toLowerCase() != "btc")
      return res.status(400).json({
        error: true,
        message: "You can set alerts for BTC only.",
      });

    // Create alert by pushing the object to the alerts array.

    let prices = await currentPrice();

    if (prices.error) return res.status(500).json(errorObject);

    const { market_price_usd } = prices.data.data;

    createAlert({
      _id: crypto.createHmac("sha256", "secret_hand").digest("hex"),
      price: market_price_usd,
      asset: asset,
      margin: margin,
      phone: phone,
      createdAt: new Date(),
    });

    return res.send({ success: true, message: "Alert created" }); //Send response
  } catch (error) {
    console.log("There was an error: ", error);
    return res.status(500).json(errorObject);
  }
};

// fetch all the alerts
exports.GetAlerts = async (req, res) => {
  const alerts = await getAlerts();

  return res.send({ success: true, alerts: alerts });
};

exports.getCurrencies = async (req, res) => {


  const currencies = await fetchCurrencies();

  console.log(currencies);

  return res.send({ success: true, currencies: currencies });
};

exports.removeAlert = async (req, res) => {
  const { id } = req.params;

  const pos = alerts.findIndex((i) => {
    return i._id == id;
  });

  if (pos > -1) {
    alerts.splice(pos, 1);
  }
  await clearOrUpdate(alerts);

  const updatedAlerts = await getAlerts();

  return res.send({ success: true, alerts: updatedAlerts });
};

exports.editAlert = async (req, res) => {
  const alerts = await getAlerts();

  const { _id, margin, phone, createdAt, asset } = req.body;

  const pos = alerts.findIndex((i) => {
    return i._id == _id;
  });

  if (pos > -1) {
    alerts[pos] = {
      _id,
      margin,
      phone,
      createdAt,
      asset,
      updatedAt: new Date(),
    };

    await clearOrUpdate(alerts);
  }

  const updatedAlerts = await getAlerts();

  return res.send({ success: true, alerts: updatedAlerts });
};

exports.clearAlerts = async (req, res) => {
  await clearOrUpdate();

  return res.status(200).json({
    status: "success",
    msg: "Alerts cleared successfully",
  });
};
