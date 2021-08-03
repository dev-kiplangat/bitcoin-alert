const fs = require("fs/promises");
const { fetchCurrencies } = require('../helpers')

class _monitor {
  constructor(data) {
    this.data = data;
  }

  async _write(data) {
    try {
      await fs.writeFile(
        path.join(__dirname, "..", "..", "..", "data", "bitcoin.json"),
        JSON.stringify(data)
      );
      return 1;
    } catch (err) {
      return 0;
    }
  }

  async _read() {
    try {
      const data = await fs.readFile(
        path.join(__dirname, "..", "..", "..", "data", "bitcoin.json")
      );

      const Out = JSON.parse(data);

      return Out;
    } catch (err) {
      return 0;
    }
  }

  async commit() {
        let out = await fetchCurrencies()
        
        if (out.success === true){
            let data = out.currencies.data.data

            for(const cur of data){
                    console.log(cur)
            }
        }
        
  }

  async Engine() {
    const data = await this._read();




  }
}

module.exports = _monitor;
