// const fs = require("fs");

const fs = require("fs/promises");
const path = require("path");

const addAlertToFile = async (dataArr) => {
  try {
    await fs.writeFile(
      path.join(__dirname, "..", "..", "..", "data", "data.json"),
      JSON.stringify(dataArr)
    );
  } catch (err) {
    return {
      error: true,
      msg: err,
    };
  }
};

const find = async () => {
  // console.log( path.join(__dirname, "..", "..", "..", "data", "data.json"))
  const data = await fs.readFile(
    path.join(__dirname, "..", "..", "..", "data", "data.json")
  );

  const Out = JSON.parse(data);

  return Out;
};

exports.getAlerts = async () => {

  const data = await find();
  return data;
};

exports.clearOrUpdate = async (data = []) => {
  await addAlertToFile(data);
};

exports.createAlert = async (data) => {
  const dataArr = await find();

  dataArr.push(data);
  await addAlertToFile(dataArr);
};
