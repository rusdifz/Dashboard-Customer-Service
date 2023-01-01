import express from 'express';
import bodyParser from 'body-parser';
import camelcaseKeys from 'camelcase-keys';
import {
  ErrorHandler,
  handleError
} from './helpers'
import cors from 'cors'

const app = express();
const makeCallback = require ('./call-back')

import {
  loginAdmin,
  dashboardAdmin, 
  caringMenu, 
  assignTask,
  resetAssignTask,

  loginObc,
  caringActivity,
  myPerformance, 
  reports, 
  caringOutcome, 
  caringDescription, 
  obcList, 
  downloadReports, 
  downloadReportsBlob, 
  submitCaring, 
  picList,

  signupAdmin,
  signupObc
} from './controller'

app.use(bodyParser.json({limit: '100000kb'}));
app.use(cors());

// endpoint general 
app.post('/login', makeCallback(loginAdmin,camelcaseKeys)) 

// endpoint admin
app.post('/admin/signup', makeCallback(signupAdmin,camelcaseKeys)) 
app.get('/admin/dashboard', makeCallback(dashboardAdmin,camelcaseKeys))
app.get('/admin/caring', makeCallback(caringMenu,camelcaseKeys)) 
app.post('/admin/caring/assign', makeCallback(assignTask,camelcaseKeys))
app.post('/admin/reset-data', makeCallback(resetAssignTask,camelcaseKeys))

// endpoint agent
app.post('/obc/signup', makeCallback(signupObc,camelcaseKeys)) 
app.get('/obc/caring-activity', makeCallback(caringActivity,camelcaseKeys)) 
app.get('/obc/my-performance', makeCallback(myPerformance,camelcaseKeys))
app.get('/obc/caring-outcome', makeCallback(caringOutcome,camelcaseKeys))
app.get('/obc/caring-description', makeCallback(caringDescription,camelcaseKeys)) 
app.get('/obc/reports', makeCallback(reports,camelcaseKeys)) 
app.get('/obc/list', makeCallback(obcList,camelcaseKeys)) 
app.get('/obc/reports/download', makeCallback(downloadReports,camelcaseKeys))
app.get('/obc/reports/download/buffer', makeCallback(downloadReportsBlob,camelcaseKeys))
app.post('/obc/caring/submit', makeCallback(submitCaring,camelcaseKeys))
app.get('/obc/list/pic', makeCallback(picList,camelcaseKeys)) 

//endpoint check server
app.get('/server_check',function(req,res){
  res.send({
    statusCode: 200,
      body: {
      responseCode : 200,
      data:'service good'
    }
  });
})

app.use((err, req, res, next) => {
    handleError(err, res);
});

export default app;
