from fastapi import HTTPException, status
from database import SessionLocal
import models
import bcrypt
import jwt
from datetime import datetime, timedelta

def checkEmailExit(email):
    try:
        db=SessionLocal()
        user= db.query(models.User).filter(models.User.email==email).first()
        if user:
            return True
        else:
            return False
    except Exception as e:
        return {
            "error": str(e)
        }
        
def checkCountPass(password):
    if len(password) > 6:
        return True
    else:
        return False

def checkFirstPassword(password):
   if password and password[0].isupper():
        return True
   else:
        return False
    

def checkUserNameExit(username):
    try:
        db=SessionLocal()
        user= db.query(models.User).filter(models.User.username==username).first()
        if user:
            return True
        else:
            return False
    except Exception as e:
        return {
            "error": str(e)
        }

def checkPassword(password,hash_password):
    return bcrypt.checkpw(password.encode('utf-8'), hash_password.encode('utf-8'))

        
def registerUser(user):
    db = SessionLocal()
    if (not user.name) or (not user.email) or (not user.username) or (not user.password) or (not user.address):
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng điền đủ thông tin !"
        )
    checkEmail= checkEmailExit(user.email)
    if checkEmail:
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT, detail="Email đã đăng ký vui lòng thử lại !"
        )
    checkUserName= checkUserNameExit(user.username)
    if checkUserName:
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT, detail="Tên đăng nhập đã tồn tại !"
        )
    if(checkCountPass(user.password)==False):
         raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng điền mật khẩu từ 7 ký tự trở nên !"
        )
    if(checkFirstPassword(user.password)==False):
         raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng điền mật khẩu bắt đầu bằng ký tự hoa !"
        )
    hashed_password = bcrypt.hashpw(user.password.encode('utf-8'), bcrypt.gensalt())
    user.password = hashed_password.decode('utf-8')
    db.add(user)
    db.commit()
    db.refresh(user)
    return {
        "success": True,
        "message": "Đăng ký thành công !",
        "user": user
    }

def createJWT(user_id):
    now= datetime.utcnow()
    expire =now + timedelta(minutes=30)
    payload = {
        'user_id': user_id,
        'exp': expire,
        'iat': now
    }
    token = jwt.encode(payload, 'auth-key', algorithm='HS256')
    return token

def verifyJWT(token,secret_key):
    decoded_token = jwt.decode(token, secret_key, algorithms=['HS256'])
    return decoded_token
    

def loginUser(user):
    db= SessionLocal()
    if (not user.username) or (not user.password):
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,detail="Vui lòng điền đầy đủ thông tin đăng nhập"
        )
    get_user = db.query(models.User).filter(models.User.username==user.username).first()
    if not get_user:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,detail="Tên đăng nhập không tồn tại vui lòng thử lại !"
        )
    if get_user.role_id==2:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,detail="Vui lòng đăng nhập tài khoản khác !"
        )
    check_password= checkPassword(user.password,get_user.password)
    if check_password==False:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED, detail="Mật khẩu không chính xác vui lòng thử lại !"
        )
    else:
        token = createJWT(get_user.id)
        return {
        "success": True,
        "message": "Đăng nhập thành công !",
        "token": token,
        "user": get_user
    }
        
def authLoginUser(token):
    db=SessionLocal()
    decoded= verifyJWT(token,'auth-key')
    get_user= db.query(models.User).filter(models.User.id==decoded['user_id'])
    if not get_user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED, detail="Xác thực đăng nhập thất bại!"
        )
    else:
        return {
            "success": True,
            "message": "xác thực đăng nhập thành công !",
        }
        
def handleGetUserLogin(user_id):
    db=SessionLocal()
    user= db.query(models.User).filter(models.User.id==user_id).first()
    return {
        "id":user.id,
        "name":user.name,
        "email":user.email,
        "username":user.username,
        "address":user.address
    }
    
        
    
    
    
    
    