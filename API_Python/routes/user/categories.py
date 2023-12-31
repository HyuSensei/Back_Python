from fastapi import APIRouter, HTTPException, status, Query
from controllers.user import CategoryController

router=APIRouter()

@router.get("/api/v1/categories/{id}",status_code=status.HTTP_200_OK)
def getCategory(
    id: int,
    page: int = Query(1, ge=1),
):
    try:
        get_category= CategoryController.handleCategory(id,page)
        return get_category
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )

@router.get("/api/v1/categories",status_code=status.HTTP_200_OK)
def getCategoryAll():
    try:
        get_category= CategoryController.handleCategoryAll()
        return get_category
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail=str(e)
        )       
        