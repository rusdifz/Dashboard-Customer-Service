export default function buildMakeTask(moment){
  return function makeTask({
    obcId = '', 
    internetId = '',
    status = 'Assigned',
    createdTime = moment().format('YYYY-MM-DD HH:mm:ss')
  } = {}) {

    if (!obcId){
      throw new Error('obc id must be exist')
    }

    if (!internetId){
      throw new Error('internet id must be exist')
    }
   
    return Object.freeze({
      getObcId : () => obcId,
      getInternetId : () => internetId,
      getStatus : () => status,
      getCreatedTime : () => createdTime
    })
  
  }     
}
  