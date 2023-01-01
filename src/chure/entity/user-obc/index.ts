import buildMakeUserObc from './user-obc'
import moment from 'moment'
moment.locale('id')

const makeUserObc = buildMakeUserObc(moment)

export default makeUserObc
