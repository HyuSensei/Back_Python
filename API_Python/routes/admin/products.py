from fastapi import APIRouter, HTTPException, status,Path,Query
from controllers.admin import AdminProductController
import models
from database import SessionLocal
from pydantic import BaseModel
from datetime import date
router=APIRouter()

class ProductsBase(BaseModel):
    name: str
    image: str
    price: float
    description: str
    quantity: int
    category_id: int
    manufacture: date
    expiry: float
    sale: int
    brand_id: int

class ProductSale(BaseModel):
    manufacture: str
    expiry: float
    sale: int

@router.post("/api/v1/addProduct/",status_code=status.HTTP_201_CREATED)
async def addProducts(product: ProductsBase):
    try:
        data_product = models.Product(**product.dict())
        db_product  = AdminProductController.addProduct(data_product)
        return db_product
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )
@router.get("/api/v1/prodouct/limit/{currentPage}",status_code=status.HTTP_200_OK)
async def getProduct(currentPage : int = Path(..., title="page", ge=1)):
    try:
        db_product  = AdminProductController.getProducts(currentPage)
        return db_product
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )
@router.get("/api/v1/prodouctdesc/limit/{currentPage}",status_code=status.HTTP_200_OK)
async def getProductDESC(currentPage : int = Path(..., title="page", ge=1)):
    try:
        db_product  = AdminProductController.getProductsDESC(currentPage)
        return db_product
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )
@router.get("/api/v1/prodouctasc/limit/{currentPage}",status_code=status.HTTP_200_OK)
async def getProductDESC(currentPage : int = Path(..., title="page", ge=1)):
    try:
        db_product  = AdminProductController.getProductsASC(currentPage)
        return db_product
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )
@router.get("/api/v1/prodouctsale/limit/{currentPage}",status_code=status.HTTP_200_OK)
async def getProductSale(currentPage : int = Path(..., title="page", ge=1)):
    try:
        db_product  = AdminProductController.getProductsSale(currentPage)
        return db_product
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )
@router.get("/api/v1/prodouct/count",status_code=status.HTTP_200_OK)
async def getCountProduct():
    try:
        db_product  = AdminProductController.countProducts()
        return db_product
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )
@router.get("/api/v1/product/{product_id}",status_code=status.HTTP_200_OK)
async def getProductsById(product_id: int = Path(..., title="ID sản phẩm cần lấy", ge=1)):
    try:
        db_product  = AdminProductController.getProductById(product_id)
        print(db_product)
        return db_product
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )
@router.get("/api/v1/productByName/{product_name}",status_code=status.HTTP_200_OK)
async def getProductsByName(product_name: str = Path(..., title="nhap ten san pham")):
    try:
        db_product  = AdminProductController.getProductByName(product_name)
        return db_product
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )
@router.get("/api/v1/productByNamePage/{product_name}/page/{currentPage}",status_code=status.HTTP_200_OK)
async def getProductsByNamePage(product_name: str, currentPage: int = Path(..., title="nhap ten san pham")):
    try:
        db_product  = AdminProductController.getProductByNamePage(product_name, currentPage)
        return db_product
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )
@router.put("/api/v1/updateProduct/{product_id}",status_code=status.HTTP_200_OK)
async def updateProducts(product_id: int , product_data: ProductsBase):
    try:
        data_product = models.Product(**product_data.dict())
        db_product  = AdminProductController.updateProduct(product_id, data_product)
        return db_product
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )
@router.delete("/api/v1/deleteProduct/{product_id}",status_code=status.HTTP_200_OK)
async def deleteProducts(product_id: int):
    try:
        db_product  = AdminProductController.deleteProduct(product_id)
        return db_product
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )

@router.get("/api/v1/product_expire",status_code=status.HTTP_200_OK)
def getProductExpire():
    try:
        db_product  = AdminProductController.handleGetProductExpire()
        return db_product
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )

@router.put("/api/v1/updateSaleProduct/{product_id}",status_code=status.HTTP_200_OK)
def updateSaleProduct(product_id: int , product_data: ProductSale):
    try:
        data_product = models.Product(**product_data.dict())
        db_product  = AdminProductController.handleUpdateSaleProduct(product_id, data_product)
        return db_product
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )