const express = require('express')
const path = require('path')
const app = express()
const fs = require('fs')
const port = 80

app.set('view engine', 'ejs')
app.use('/', express.static(path.join(__dirname + '/views')))
app.listen(port, () => console.log(`Example app listening on port ${port}!`))

app.get('/', function(req, res) {
  res.render('index.ejs')
})

app.get('/get-file/:location', async function(req, res) {
  const data = await fs.readFileSync(req.params.location, 'utf8')
  res.json({success: true, info: data})
})

