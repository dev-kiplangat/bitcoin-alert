const express = require("express");
const colors = require("colors");
const logger = require("morgan");

colors.setTheme({
  silly: "rainbow",
  input: "grey",
  verbose: "cyan",
  prompt: "grey",
  info: "green",
  data: "grey",
  help: "cyan",
  warn: "yellow",
  debug: "blue",
  error: "red",
});

const app = express();
const PORT = 1080 || process.env.PORT;

// settings
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// user imports
const routes = require("./engine/router");
const alertMonitor = require("./engine/workers/main");

app.use(routes)
alertMonitor.start();

app.listen(PORT, async() => {
  console.log(`crypto alert running ${PORT}`.yellow);
});
