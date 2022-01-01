const express = require('express')
const app = express()
const port = 3000

const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

const fs = require("fs");

var random_no = Math.random()
var utterance = ""

var public_ip = get_my_public_ip()

app.listen(port, "0.0.0.0", () => {
  console.log(`Example app listening at ${public_ip}:${port}`)
})

app.get('/', (req, res) => {
  var page = (
    fs.readFileSync("index.html")
    .toString()
    .replace("$url$", '"http://' + public_ip + ':' + String(port) + '/utterance"')
  )
  res.send(page);
  console.log('Someone accessed the app')
})

app.get('/utterance', (req, res) => {
  body = {"utterance": utterance, "random_no": random_no}
  res.send(body)
  console.log(`I said "${body["utterance"]}" with number: ${random_no}`)
})

app.post('/utterance', (req, res) => {
  utterance = req.body["utterance"]
  random_no = Math.random()
  console.log(utterance)
  console.log(random_no)
  res.send("ack")
})

function get_my_public_ip () {
  const { networkInterfaces } = require('os');
  const nets = networkInterfaces();
  for (const name of Object.keys(nets)) {
    for (const net of nets[name]) {
      if (net.family === 'IPv4' && !net.internal) {
        myip = net.address;
      }
    }
  }
  return myip
}
