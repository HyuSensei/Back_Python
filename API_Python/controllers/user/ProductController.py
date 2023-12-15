from fastapi import HTTPException, status
from database import SessionLocal
import models
from datetime import datetime, timedelta,date
from sqlalchemy import func

def handleGetProductHome():
    db=SessionLocal()
    product_srm= db.query(models.Product).filter(models.Product.category_id==1).all()
    product_kcn= db.query(models.Product).filter(models.Product.category_id==2).all()
    product_sr= db.query(models.Product).filter(models.Product.category_id==3).all()
    return {
        "success":True,
        "product_srm":product_srm,
        "product_kcn":product_kcn,
        "product_sr":product_sr
    }

def handleGetProductSale():
    db = SessionLocal()
    # Lấy các sản phẩm từ database
    products = db.query(models.Product).all()
    today = datetime.combine(date.today(), datetime.min.time())
    valid_products = []
    for product in products:
        if product.manufacture is not None and product.expiry is not None:
            # Ngày sản xuất
            manufacture_date_str = product.manufacture.strftime("%d-%m-%Y")
            manufacture_date = datetime.strptime(manufacture_date_str, "%d-%m-%Y")
            # Hạn sử dụng (số năm)
            expiry_years = product.expiry
            # Tính ngày hết hạn
            expiry_date = manufacture_date + timedelta(days=365 * expiry_years)
            # days_remaining = (expiry_date - datetime.now()).days
            # print("Ngay het han:",expiry_date)
            # print("Ngay con lai:",days_remaining)
            # print("Sau 1 nam:",one_year_from_now)
            days_before_expiry = (expiry_date - today).days
            if 0 <= days_before_expiry <= 365:
                valid_products.append(product)
    return {
        "success":True,
        "product":valid_products
    }

def handleGetProductOrderTop():
    db = SessionLocal()
    products = (
    db.query(models.Product, func.count(models.OrderProduct.product_id))
    .join(models.OrderProduct)
    .join(models.Order)
    .filter(models.Order.status == 2)
    .group_by(models.Product.id)
    .having(func.count(models.OrderProduct.product_id) >= 2)
    .all()
    )
    product_list=[]
    for product, order_count  in products:
        get_product={
            "id":product.id,
            "price": product.price,
            "quantity": product.quantity,
            "sale": product.sale,
            "expiry": product.expiry,
            "image": product.image,
            "name": product.name,
            "description": product.description,
            "category_id": product.category_id,
            "manufacture": product.manufacture,
            "sold":order_count
        }
        product_list.append(get_product)
    return {
        "success": True,
        "products": product_list
    }
    
def storeProduct(product):
    db=SessionLocal()
    db.add(product)
    db.commit()
    db.refresh(product)
    return {
        "success": True,
        "message": "Thêm sản phẩm thành công !",
        "product": product
    }

def handleProductDetailCart(product_id):
    db=SessionLocal()
    product= db.query(models.Product).filter(models.Product.id==product_id).first()
    return {
        "id":product.id,
        "name":product.name,
        "image":product.image,
        "price":product.price,
        "sale":product.sale,
        "expiry":product.expiry,
        "manufacture":product.manufacture,
        "description":product.description,
        "category_id ":product.category_id
    }
    
def handleSearchProduct(product_name,page,limit):
    db=SessionLocal()
    limit = 8
    start = (page - 1) * limit
    query = db.query(models.Product)
    if product_name:
        query = query.filter(models.Product.name.ilike(f"%{product_name}%"))
    total = query.count()
    products = query.offset(start).limit(limit).all()
    total_page = (total // limit) + (1 if total % limit > 0 else 0)
    current_page = page if page <= total_page else total_page
    return {
        "success": True,
        "total": total,
        "total_page":total_page,
        "current_page": current_page,
        "products": products
    }
    
def handleProductDetail(product_id):
    db=SessionLocal()
    product= db.query(models.Product).filter(models.Product.id==product_id).first()
    data_product={
        "id":product.id,
        "name":product.name,
        "image":product.image,
        "price":product.price,
        "sale":product.sale,
        "description":product.description,
        "category_id ":product.category_id
    }
    count_rate = db.query(models.Rate).filter(models.Rate.product_id == product_id).count()
    star_one = db.query(models.Rate).filter(models.Rate.product_id == product_id).filter(models.Rate.star == 1).count()
    star_two = db.query(models.Rate).filter(models.Rate.product_id == product_id).filter(models.Rate.star == 2).count()
    star_three = db.query(models.Rate).filter(models.Rate.product_id == product_id).filter(models.Rate.star == 3).count()
    star_four = db.query(models.Rate).filter(models.Rate.product_id == product_id).filter(models.Rate.star == 4).count()
    star_fine = db.query(models.Rate).filter(models.Rate.product_id == product_id).filter(models.Rate.star == 5).count()
    get_star={
        "one":star_one,
        "two":star_two,
        "three":star_three,
        "four":star_four,
        "fine":star_fine
    }
    query = (
    db.query(models.Rate, models.User)
    .join(models.User, models.User.id == models.Rate.user_id)
    .filter(models.Rate.product_id == product_id)
    )
    rates = query.all()
    list_rate=[]
    for rate, user in rates:
        get_rate={
            "id":rate.id,
            "user_id": rate.user_id,
            "star": rate.star,
            "comment": rate.comment,
            "user_name": user.name,
            "createdAt":rate.createdAt
        }
        list_rate.append(get_rate)
    # print(list_rate)
    # print(data_product)
    # print(count_rate)
    # print(get_star)
    return {
        "success":True,
        "message":"Chi tiết sản phẩm !",
        "product": data_product,
        "rate":list_rate,
        "count_rate":count_rate,
        "count_star":get_star
    }

 

    
    