from fastapi import APIRouter, HTTPException, status, Query
from controllers.user import BrandController

router=APIRouter()

@router.get("/api/v1/brands/{id}",status_code=status.HTTP_200_OK)
def getProductBrand(
    id: int,
    page: int = Query(1, ge=1),
):
    try:
        get_brand= BrandController.handleGetProductBrand(id,page)
        return get_brand
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )

@router.get("/api/v1/brands",status_code=status.HTTP_200_OK)
def getBrandAll():
    try:
        get_brand= BrandController.handleBrandAll()
        return get_brand
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )       
        