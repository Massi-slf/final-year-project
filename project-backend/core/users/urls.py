from django.urls import path

from .views import (
    # UserProfileUpdateRetrieveView,
      UserRegistrationView,
    )

app_name = "users"

urlpatterns = [
    path("signup/", UserRegistrationView.as_view(), name="signup"),
]
