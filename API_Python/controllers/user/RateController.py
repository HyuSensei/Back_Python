from fastapi import HTTPException, status
from database import SessionLocal
import models 

def handleRate(rate):
    if (not rate.star):
        raise HTTPException(
            status_code= status.HTTP_400_BAD_REQUEST, detail="Vui lòng chọn đầy đủ thông tin đánh giá !"
        )
    if (not rate.comment):
        raise HTTPException(
            status_code= status.HTTP_400_BAD_REQUEST, detail="Vui lòng chọn đầy đủ thông tin đánh giá !"
        )
    db=SessionLocal()
    db.add(rate)
    db.commit()
    db.refresh(rate)
    return {
        "success": True,
        "message": "Đánh giá sản phẩm thành công !",
        "rate": rate
    }

