from fastapi import APIRouter, HTTPException, status, Query
from controllers.admin import AdminBrands

router=APIRouter()

@router.get("/api/v1/brandsbyId/{id}",status_code=status.HTTP_200_OK)
def getProductBrand(
    id: int,
    page: int = Query(1, ge=1),
):
    try:
        get_brand= AdminBrands.handleGetProductBrand(id,page)
        return get_brand
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )

@router.get("/api/v1/getAllbrands",status_code=status.HTTP_200_OK)
def getBrandAll():
    try:
        get_brand= AdminBrands.handleBrandAll()
        return get_brand
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )  