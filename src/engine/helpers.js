const axios = require("axios");
const path = require("path");
require("dotenv").config({ path: "../../../config" });
const fs = require("fs/promises");

// exports.fetchCurrencies = async () => {
//   try {
//     const resp = await axios.get(process.env.COIN_URL + "stats");
//     return {
//       error: false,
//       // data: { BTC: resp.data[0].price, ETH: resp.data[1].price },
//       data: resp.data,
//     };
//   } catch (err) {
//     return { error: true, data: err };
//   }
// };

exports.fetchCurrencies = async () => {
  try {
    const data = await fs.readFile(
      path.join(__dirname, "..", "..", "data", "bitcoin.json")
    );

    // console.log(data);
    const Out = JSON.parse(data);

    return {
      error: false,
      // data: { BTC: resp.data[0].price, ETH: resp.data[1].price },
      data: Out.data,
    };
  } catch (err) {
    return { error: true, data: err };
  }
};

exports.currentPrice = async () => {
  try {
    const resp = await axios.get(process.env.COIN_URL + "bitcoin/stats");

    // console.log(resp.data)
    return {
      error: false,
      // data: { BTC: resp.data[0].price, ETH: resp.data[1].price },
      data: resp.data,
    };
  } catch (err) {
    return { error: true, data: err };
  }
};

exports.MessageClient = (target, data, smsMessage) => {
  smsMessage.from = "+254718287786";
  smsMessage.to = target;
  smsMessage.body = data;

  return smsMessage;
};

exports.errorObject = () => {
  return {
    error: true,
    message: "Oops, something went wrong.Please try again later.",
  };
};
