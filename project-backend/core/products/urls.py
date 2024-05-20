
from django.urls import path
from .views import (ProductsAddListView,
                     DetailedProductView,
                        CategoryListCreateManagerView,
                        CategoryUpdateDeleteView,
                     )

urlpatterns = [
    path('', ProductsAddListView.as_view(), name='product-list'),
    path('<str:slug>/', DetailedProductView.as_view(), name='product-detail'),
    path('categories/manager/', CategoryListCreateManagerView.as_view(), name='product-categories'),
    path('categories/manager/<str:id>/', CategoryUpdateDeleteView.as_view(), name='product-category'),
]
