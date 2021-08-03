const dotenv = require("dotenv");
const path = require('path')
dotenv.config({ path: path.join(__dirname, "..", "..", "..", "config", "index.env") } );


const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;

console.log(accountSid)
const client = require("twilio")(accountSid, authToken);

module.exports = async (target, messageBody) => {
  try {
    const message = await client.messages.create({
      body: messageBody,
      from: process.env.TWILIO_NUMBER,
      to: target,
      // statusCallback: 'http://postb.in/1234abcd' call status url
    });

    return {
      status: "success",
      sms_status: message.sid,
    };


  } catch (err) {
    return {
      status: "error",
      msg: err,
    };
  }
};
