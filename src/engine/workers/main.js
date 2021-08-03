const CronJob = require("cron").CronJob;
const { getAlerts } = require("../controller/alerts");
const { currentPrice } = require("../helpers");

const messengerApi = require("../notify/alt-sms");

var alertMonitor = new CronJob(
  "*/60 */5 * * * *", // Run every 10 secs
  async function () {
    try {
      const alerts = await getAlerts();

      if (alerts.length ==  0){
        console.log("No alerts found")
        return;
      }

      console.log("ticker is running ...");

      const prices = await currentPrice();

      if (prices.error) {
        console.log("There was an error: ", prices.data);
        return;
      }

      const { market_price_usd } = prices.data.data;

      for (const alert of alerts) {
        console.log(`firing on all fronts ...${alert}`);
        console.log(market_price_usd);
        console.log(alert.price);

        let diff = market_price_usd - alert.price;
        let message = "";

        console.log(alert);
        // negative values
        if (diff < 0 && Math.abs(diff) > alert.margin) {
          // send sell

          console.log("sell");
          message = `Price of ${alert.asset} has just DROPPED your alert price of ${alert.price} USD.
       Current price is ${market_price_usd} USD.\n\nALERT: SELL`;
          const state = await messengerApi(alert.phone, message);
          console.log(state.green);
        }

        if (diff > alert.margin) {
          // send buy
          console.log("buy");

          message = `Price of ${alert.asset} has just EXCEEDED your alert price of ${alert.price} USD.
        Current price is ${market_price_usd} USD.\n\nALERT: BUY`;

          const state = await messengerApi(alert.phone, message);
          console.log(state);
        }
      }
    } catch (err) {
      console.log("There was an error: ", err);
    }
  }
);

module.exports = alertMonitor;
