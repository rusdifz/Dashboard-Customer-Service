import jwt from 'jsonwebtoken'

function authjwt() {
    return function auth(body) {
        try{
            
            let decode = jwt.decode(body.jwt)
            console.log('decode', decode);
            
            if(body.role == decode.role){
                return true
            }
    
            return false

        }catch(error:any){
            throw new Error('auth-jwt '+error)
        }
    }
}

const authJwt = authjwt()

export default authJwt