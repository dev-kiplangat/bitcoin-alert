var api = require("../../../node_modules/clicksend/api.js");
const path = require("path");
const dotenv = require('dotenv')


const { MessageClient } = require("../helpers");

dotenv.config({
  path: path.join(__dirname, "..", "..", "..", "config", "index.env"),
});

var smsApi = new api.SMSApi(process.env.CLICKSEND_USER, process.env.CLICKSEND_API_KEY);

module.exports = async (target, data_to_send) => {
  var smsCollection = new api.SmsMessageCollection();

  const smsMessage = new api.SmsMessage();
  smsCollection.messages = [MessageClient(target, data_to_send, smsMessage)];

  try {
    const response = await smsApi.smsSendPost(smsCollection);

    if (response.body.response_code == "SUCCESS") {
      if (response.body.data.total_price > 0) {
        
        return {
          status: "success",
          sms_status: response.body,
        };
      } else {
        return {
          status: "success",
          sms_status: response.body,
        };
      }
    }
  } catch (err) {
    return {
      status: "error",
      msg: err,
    };
  }
};
