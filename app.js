const config = require('./config');

const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello Azure!');
});

const port = process.env.PORT || config.port;

app.listen(port, '0.0.0.0', () => {
  console.log(`Server started on port ${port}`);
});
