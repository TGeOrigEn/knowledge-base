require('dotenv').config();

const { WEB_PORT, WEB_HOST } = process.env;

module.exports = {
  devServer: {
    host: WEB_HOST,
    port: WEB_PORT
  }
}