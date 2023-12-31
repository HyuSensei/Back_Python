from fastapi import HTTPException, status
from database import SessionLocal
from models import Order, OrderProduct, Product
from sqlalchemy.orm import joinedload

def getAllOrder():
    db= SessionLocal()
    #orders = db.query(Order).options(joinedload(Order.order_product).joinedload(OrderProduct.product_id == Product.id )).all()
    orders = db.query(Order).options(joinedload(Order.order_product).joinedload(OrderProduct.product)).all()

    if not orders:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail="Không tìm thấy order !"
        )
    return {
        "success": True,
        "message":"Tìm order thành công !",
        "order": orders
    }
    
def getOrderPage(currentPage):
    limit = 3
    offset = (currentPage - 1) * limit
    db= SessionLocal()
    orders = db.query(Order).options(joinedload(Order.order_product).joinedload(OrderProduct.product)).limit(limit).offset(offset).all()
    return {
        "success": True,
        "message":"Tìm order thành công !",
        "order": orders
    }
    
def confirmOrder(order_id):
    db= SessionLocal()
    orders = db.query(Order).filter(Order.id == order_id).first()

    if orders is None:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail="order không tồn tại !"
        )
    orders.status = 1
    db.commit()
    db.refresh(orders)
    
    return {
        "success": True,
        "message":"confirm order thành công !",
        "order": orders
    }
    
def deleteOrder(order_id):
    try:
        db= SessionLocal()
        order = db.query(Order).filter(Order.id == order_id).first()

        if order is None:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="order không tồn tại !"
            )
        db.delete(order)
        db.commit()
        return {
            "success": True,
            "message":"order sản phẩm thành công!",
        }
    except Exception as e:
        return {
            "success": False,
            "message":"order sản phẩm thất bại!",
            "err": e
        }