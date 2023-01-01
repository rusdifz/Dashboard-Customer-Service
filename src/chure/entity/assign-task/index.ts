import buildMakeTask from './assign-task'
import moment from 'moment'
moment.locale('id')

const makeTask = buildMakeTask(moment)

export default makeTask
