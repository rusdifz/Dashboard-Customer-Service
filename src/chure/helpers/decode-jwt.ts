import jwt from 'jsonwebtoken'

function decodejwt() {
    return function auth(body) {
        try{
            
            let decode = jwt.decode(body)
            return decode

        }catch(error:any){
            throw new Error('decode-jwt '+error)
        }
    }
}

const decodeJwt = decodejwt()

export default decodeJwt