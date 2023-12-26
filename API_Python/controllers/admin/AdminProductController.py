from fastapi import HTTPException, status
from database import SessionLocal
from models import Product 
from datetime import datetime, timedelta,date
from sqlalchemy import func, desc, asc
import models

def addProduct(product):
    try:
        db= SessionLocal()
        if not product.name:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng nhập tên sản phẩm !"
            )
        if not product.image:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng nhập ảnh sản phẩm !"
            )
        if not product.price:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng nhập giá sản phẩm !"
            )
        if not product.description:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng nhập mô tả sản phẩm !"
            )
        if not product.quantity:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng nhập số lượng sản phẩm !"
            )
        if not product.category_id:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng nhập sanh mục sản phẩm !"
            )
        if not product.manufacture:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng nhập ngày hết sản xuất!"
            )
        db.add(product)
        db.commit()
        db.refresh(product)
        return {
            "success": True,
            "message":"Thêm sản phẩm thành công!",
            "product": product
        }
    except Exception as e:
        return {
            "success": False,
            "message":"Thêm sản phẩm thất bại!",
            "err": e
        }
def getProducts(currentPage):
    try:
        limit = 6
        offset = (currentPage - 1) * limit
        db = SessionLocal()
        products = db.query(Product).limit(limit).offset(offset).all()
        return {
            "success": True,
            "message": "Tìm sản phẩm thành công!",
            "products": products
        }
    except Exception as e:
        return {
            "success": False,
            "message": "Tìm sản phẩm thất bại!",
            "err": str(e)
        }
def getProductsSale(currentPage):
    try:
        limit = 6
        offset = (currentPage - 1) * limit
        db = SessionLocal()
        products = db.query(Product).filter(Product.sale > 0).limit(limit).offset(offset).all()
        sale_count = db.query(func.count(Product.id)).filter(Product.sale > 0).scalar()
        return {
            "success": True,
            "message": "Tìm sản phẩm thành công!",
            "products": products,
            "sale_count": sale_count
        }
    except Exception as e:
        return {
            "success": False,
            "message": "Tìm sản phẩm thất bại!",
            "err": str(e)
        }
def getProductsDESC(currentPage):
    try:
        limit = 6
        offset = (currentPage - 1) * limit
        db = SessionLocal()

        # Add order_by clause to sort products by price in descending order
        products = db.query(Product).order_by(desc(Product.price)).limit(limit).offset(offset).all()

        return {
            "success": True,
            "message": "Tìm sản phẩm thành công!",
            "products": products
        }
    except Exception as e:
        return {
            "success": False,
            "message": "Tìm sản phẩm thất bại!",
            "err": str(e)
        }
def getProductsASC(currentPage):
    try:
        limit = 6
        offset = (currentPage - 1) * limit
        db = SessionLocal()

        # Add order_by clause to sort products by price in descending order
        products = db.query(Product).order_by(asc(Product.price)).limit(limit).offset(offset).all()

        return {
            "success": True,
            "message": "Tìm sản phẩm thành công!",
            "products": products
        }
    except Exception as e:
        return {
            "success": False,
            "message": "Tìm sản phẩm thất bại!",
            "err": str(e)
        }
def countProducts():
    try:
        db = SessionLocal()
        product_count = db.query(func.count(Product.id)).scalar()
        return {
            "success": True,
            "message": "Số lượng sản phẩm đã được đếm!",
            "data": product_count
        }
    except Exception as e:
        return {
            "success": False,
            "message": "Đếm sản phẩm thất bại!",
            "err": str(e)
        }
def getProductById(product_id):
    try:
        db= SessionLocal()
        product = db.query(Product).filter(Product.id == product_id).first()
        return {
            "success": True,
            "message":"Tìm sản phẩm thành công!",
            "product": product
        }
    except Exception as e:
        return {
            "success": False,
            "message":"Tìm sản phẩm thất bại!",
            "err": e
        }
def getProductByNamePage(product_name, currentPage):
    try:
        limit = 6
        offset = (currentPage - 1) * limit
        db= SessionLocal()
        product = db.query(Product).filter(Product.name.like(f"%{product_name}%")).limit(limit).offset(offset).all()
        return {
            "success": True,
            "message":"Tìm sản phẩm thành công!",
            "product": product
        }
    except Exception as e:
        return {
            "success": False,
            "message":"Tìm sản phẩm thất bại!",
            "err": e
        }
def getProductByName(product_name):
    try:
        db= SessionLocal()
        product = db.query(Product).filter(Product.name.like(f"%{product_name}%")).all()
        return {
            "success": True,
            "message":"Tìm sản phẩm thành công!",
            "product": product
        }
    except Exception as e:
        return {
            "success": False,
            "message":"Tìm sản phẩm thất bại!",
            "err": e
        }
def updateProduct(product_id, product_data):
    try:
        db= SessionLocal()
        product = db.query(Product).filter(Product.id == product_id).first()

        if product is None:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Sản phẩm không tòn tại !"
            )
        if not product_data.name:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng nhập tên sản phẩm !"
            )
        # if not product_data.image:
        #     raise HTTPException(
        #         status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng nhập ảnh sản phẩm !"
        #     )
        if not product_data.price:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng nhập giá sản phẩm !"
            )
        if not product_data.description:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng nhập mô tả sản phẩm !"
            )
        if not product_data.quantity:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng nhập số lượng sản phẩm !"
            )
        if not product_data.category_id:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng nhập sanh mục sản phẩm !"
            )
        if not product_data.manufacture:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng nhập ngày sản xuất !"
            )
        if not product_data.brand_id:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Vui lòng nhập brand_id !"
            )
        product.name = product_data.name
        if product_data.image:
            product.image = product_data.image
        product.price = product_data.price
        product.description = product_data.description
        product.quantity = product_data.quantity
        product.category_id = product_data.category_id
        product.manufacture = product_data.manufacture
        product.brand_id = product_data.brand_id
        product.sale = product_data.sale
        
        db.commit()
        db.refresh(product)
        return {
            "success": True,
            "message":"Sửa sản phẩm thành công!",
            "product": product
        }
    except Exception as e:
        return {
            "success": False,
            "message":"Sửa sản phẩm thất bại!",
            "err": e
        }
        
def deleteProduct(product_id):
    try:
        db= SessionLocal()
        product = db.query(Product).filter(Product.id == product_id).first()

        if product is None:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Sản phẩm không tòn tại !"
            )
        db.delete(product)
        db.commit()
        return {
            "success": True,
            "message":"Xóa sản phẩm thành công!",
        }
    except Exception as e:
        return {
            "success": False,
            "message":"Xóa sản phẩm thất bại!",
            "err": e
        }
        
def handleGetProductExpire():
    db = SessionLocal()
    products = db.query(models.Product).all()
    today = datetime.combine(date.today(), datetime.min.time())
    valid_products = []
    for product in products:
        if product.manufacture is not None and product.expiry is not None:
            manufacture_date_str = product.manufacture.strftime("%d-%m-%Y")
            manufacture_date = datetime.strptime(manufacture_date_str, "%d-%m-%Y")
            expiry_years = product.expiry
            expiry_date = manufacture_date + timedelta(days=365 * expiry_years)
            days_before_expiry = (expiry_date - today).days
            if 0 <= days_before_expiry <= 365:
                valid_products.append(product)
    return {
        "success":True,
        "product":valid_products
    }

def handleUpdateSaleProduct(product_id, product_data):
    db= SessionLocal()
    print(product_data)
    product = db.query(Product).filter(Product.id == product_id).first()
    product.manufacture = product_data.manufacture
    product.sale = product_data.sale
    product.expiry = product_data.expiry
    db.commit()
    db.refresh(product)
    return {
            "success": True,
            "message":"Sửa khuyến mãi thành công",
            "product": product
        }