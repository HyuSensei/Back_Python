from sqlalchemy import Column, Integer, String, ForeignKey, DateTime, Float, Text
from sqlalchemy.orm import relationship, backref
from database import Base
from datetime import datetime

class User(Base):
    __tablename__ = 'users'
    id= Column(Integer, primary_key=True, index=True)
    name= Column(String(250))
    email= Column(String(250))
    username= Column(String(250))
    password= Column(String(250))
    address= Column(String(250))
    role_id = Column(Integer, ForeignKey('roles.id'))
    order = relationship("Order", backref=backref("users", cascade="save-update"))
    rate = relationship("Rate", backref=backref("users", cascade="save-update"))
    createdAt = Column(DateTime, default=datetime.utcnow)
    updatedAt = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

class Role(Base):
    __tablename__ = 'roles'
    id= Column(Integer, primary_key=True, index=True)
    name= Column(String(250))
    createdAt = Column(DateTime, default=datetime.utcnow)
    updatedAt = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    
class Product(Base):
    __tablename__='products'
    id= Column(Integer, primary_key=True, index=True)
    name= Column(String(250))
    image= Column(String(250))
    price= Column(Float)
    description= Column(String(250))
    quantity= Column(Integer)
    sale=Column(Integer)
    manufacture=Column(DateTime)
    expiry=Column(Float)
    category_id= Column(Integer,ForeignKey('categories.id'))
    brand_id= Column(Integer,ForeignKey('brands.id'))
    order_product = relationship("OrderProduct", backref=backref("products", cascade="delete"))
    rate = relationship("Rate", backref=backref("products", cascade="delete"))
    createdAt = Column(DateTime, default=datetime.utcnow)
    updatedAt = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

class Category(Base):
    __tablename__='categories'
    id= Column(Integer, primary_key=True, index=True)
    name= Column(String(250))
    category_parent_id= Column(Integer, ForeignKey('category_parents.id'))
    createdAt = Column(DateTime, default=datetime.utcnow)
    updatedAt = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

class Order(Base):
    __tablename__ ='orders'
    id= Column(Integer, primary_key=True, index=True)
    payment= Column(String(250))
    status= Column(Integer)
    name= Column(String(250))
    address= Column(String(250))
    phone= Column(String(250))
    total= Column(Float)
    user_id= Column(Integer, ForeignKey('users.id'))
    order_product = relationship("OrderProduct", backref=backref("orders", cascade="delete"))
    rate = relationship("Rate", backref=backref("orders", cascade="delete"))
    createdAt = Column(DateTime, default=datetime.utcnow)
    updatedAt = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

class OrderProduct(Base):
    __tablename__ ='order_products'
    id= Column(Integer, primary_key=True, index=True)
    order_id= Column(Integer, ForeignKey('orders.id'))
    product_id= Column(Integer, ForeignKey('products.id'))
    quantity= Column(Integer)
    product = relationship("Product")
    createdAt = Column(DateTime, default=datetime.utcnow)
    updatedAt = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

class Rate(Base):
    __tablename__ ='rates'
    id= Column(Integer, primary_key=True, index=True)
    product_id= Column(Integer, ForeignKey('products.id'))
    user_id= Column(Integer, ForeignKey('users.id'))
    order_id= Column(Integer, ForeignKey('orders.id'))
    star= Column(Integer)
    comment= Column(Text)
    product = relationship("Product")
    createdAt = Column(DateTime, default=datetime.utcnow)
    updatedAt = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)  

class CategoryParent(Base):
    __tablename__ ='category_parents'
    id= Column(Integer, primary_key=True, index=True)
    name= Column(String(250))
    createdAt = Column(DateTime, default=datetime.utcnow)
    updatedAt = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)  

class Brand(Base):
    __tablename__ ='brands'
    id= Column(Integer, primary_key=True, index=True)
    name= Column(String(250))
    createdAt = Column(DateTime, default=datetime.utcnow)
    updatedAt = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)  

