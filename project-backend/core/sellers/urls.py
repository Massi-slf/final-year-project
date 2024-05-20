from django.urls import path 
from .views import SellersListView,SellerDetailserializer,SellersActivationRequestsListView
app_name = "sellers"
urlpatterns = [
    path("", SellersListView.as_view(), name="sellers"),
    path("requests/", SellersActivationRequestsListView.as_view(), name="requests"),
    path("<str:id>/", SellerDetailserializer.as_view(), name="seller"),

]
