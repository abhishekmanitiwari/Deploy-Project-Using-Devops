express = require('express');
app = express();

app.get('/', function (req, res) {
  res.send('Hello World!');
  res.send('Welcome to the node app running on AWS EC2 instance!');
  res.send('This is a simple Node.js application deployed on AWS EC2 using Terraform and GitHub Actions.');
});

app.listen(8080, function () {
  console.log('Example app listening on port 8080!');
});