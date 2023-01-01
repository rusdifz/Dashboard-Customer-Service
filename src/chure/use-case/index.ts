const Cryptr = require('cryptr');
const cryptr = new Cryptr('myTotalySecretKey');

import {
  adminDb,
  obcDb
} from '../db-config'

import makeTask from '../entity/assign-task';
import makeUserAdmin from '../entity/user-admin';
import makeUserObc from '../entity/user-obc';
import decodeJwt from '../helpers/decode-jwt';

import dashboardAdminService from "./admin/dashboard-admin.service";
import caringMenuService from "./admin/caring-menu.service"
import loginAdminService from './admin/login.service';
import assignTaskService from './admin/assign-task.service';
import resetAssignTaskService from './admin/reset-assign-task.service';

import loginObcService from './obc/login.service';
import caringActivityService from './obc/caring-activity.service';
import myPerformanceService from './obc/my-performance.service';
import reportsService from './obc/reports.service';
import caringDescriptionService from './obc/caring-description.service';
import caringOutcomeService from './obc/caring-outcome.service';
import obcListService from './obc/obc-list.service';
import downloadReportsService from './obc/download-reports.service';
import submitCaringService from './obc/submit-caring.service';
import getPicListService from './obc/get-pic.service';

import signupAdminService from './admin/signup.service';
import signupObcService from './obc/signup.service';

const dataDashboardAdmin = dashboardAdminService({adminDb})
const dataCaringMenu = caringMenuService({adminDb})
const dataLoginAdmin = loginAdminService({adminDb})
const dataAssignTask = assignTaskService({adminDb,makeTask})
const dataResetAssignTask = resetAssignTaskService({adminDb})

const dataLoginObc = loginObcService({obcDb})
const dataCaringActivity = caringActivityService({obcDb,decodeJwt})
const dataMyPerformance = myPerformanceService({obcDb,decodeJwt})
const dataReports = reportsService({obcDb})
const dataCaringDescription = caringDescriptionService({obcDb})
const dataCaringOutcome = caringOutcomeService({obcDb})
const dataObcList = obcListService({obcDb})
const dataDownloadReports = downloadReportsService({})
const dataSubmitCaring = submitCaringService({obcDb,decodeJwt})
const dataPicList = getPicListService({obcDb})

const dataSignupAdmin = signupAdminService({adminDb,makeUserAdmin,cryptr})
const dataSignupObc = signupObcService({obcDb,makeUserObc,cryptr})

const chureService = Object.freeze({
  dataDashboardAdmin, 
  dataCaringMenu, 
  dataLoginAdmin,
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
})

export default chureService

export{
  dataDashboardAdmin, 
  dataCaringMenu, 
  dataLoginAdmin, 
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
}