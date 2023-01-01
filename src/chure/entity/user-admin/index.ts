import buildMakeUserAdmin from './user-admin'
import moment from 'moment'
moment.locale('id')

const makeUserAdmin = buildMakeUserAdmin(moment)

export default makeUserAdmin
