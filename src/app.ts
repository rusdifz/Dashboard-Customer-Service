import express from 'express';
import dashboard from './chure'
require('dotenv').config();

const app = express();
const port = process.env.APP_PORT

app.use('/chure', dashboard);

app.listen(port,()=> console.log(`Server is listening on port ${port}`));

// "build": "rm -rf dist/ && tsc -p ."