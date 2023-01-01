import {
  dataLoginAdmin,
  dataDashboardAdmin, 
  dataCaringMenu, 
  dataAssignTask,
  dataResetAssignTask,

  dataLoginObc,
  dataCaringActivity, 
  dataMyPerformance, 
  dataReports, 
  dataCaringDescription, 
  dataCaringOutcome, 
  dataObcList, 
  dataDownloadReports,
  dataSubmitCaring, 
  dataPicList,

  dataSignupAdmin,
  dataSignupObc
} from '../use-case'

import authJwt from '../helpers/auth-jwt'

import loginAdminController from './admin/login.controller'
import dashboardController from './admin/dashboard.controller'
import caringController from './admin/caring.controller'
import assignTaskController from './admin/assign-task.controller'
import resetAssignTaskController from './admin/reset-assign-task.controller'

import loginObcController from './obc/login.controller'
import caringActivityController from './obc/caring-activity.controller'
import myPerformanceController from './obc/my-performance.controller'
import reportsController from './obc/reports.controller'
import caringOutcomeController from './obc/caring-outcome.controller'
import caringDescriptionController from './obc/caring-description.controller'
import obcListController from './obc/obc-list.controller'
import downloadReportsController from './obc/download-reports.controller'
import downloadReportsBlobController from './obc/download-reports-blob.controller'
import submitCaringController from './obc/submit-caring.controller'
import getPicListController from './obc/get-pic.controller'

import signupAdminController from './admin/signup.controller'
import signupObcController from './obc/signup.controller'

const loginAdmin = loginAdminController({dataLoginAdmin})
const dashboardAdmin = dashboardController({dataDashboardAdmin,authJwt})
const caringMenu = caringController({dataCaringMenu,authJwt}) 
const assignTask = assignTaskController({dataAssignTask,authJwt})
const resetAssignTask = resetAssignTaskController({dataResetAssignTask,authJwt})

const loginObc = loginObcController({dataLoginObc})
const caringActivity = caringActivityController({dataCaringActivity,authJwt})
const myPerformance = myPerformanceController({dataMyPerformance,authJwt})
const reports = reportsController({dataReports,authJwt})
const caringDescription = caringDescriptionController({dataCaringDescription})
const caringOutcome = caringOutcomeController({dataCaringOutcome})
const obcList = obcListController({dataObcList})
const downloadReports = downloadReportsController({dataDownloadReports})
const downloadReportsBlob = downloadReportsBlobController({dataDownloadReports})
const submitCaring = submitCaringController({dataSubmitCaring,authJwt})
const picList = getPicListController({dataPicList})

const signupAdmin = signupAdminController({dataSignupAdmin})
const signupObc = signupObcController({dataSignupObc})

const chureController =  Object.freeze({
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
})
      
export default  chureController
export {
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
}
      