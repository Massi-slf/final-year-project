
from django.urls import path
from .views import ClientsListView,ClientManagerView

app_name = "clients"

urlpatterns = [
    path("",ClientsListView.as_view(),name="clients"),
    path("manage/<str:id>/",ClientManagerView.as_view(),name="client-manager"),
]
