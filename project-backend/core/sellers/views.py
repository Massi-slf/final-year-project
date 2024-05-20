from django.shortcuts import render
from .serializers import SellerProfileSerializer,SellerProfileSerializerForAdmin
from .models import SellerProfile
from rest_framework.permissions import IsAuthenticated,AllowAny
from users.serializers import UserSerializer
from django.shortcuts import get_object_or_404

from common.permissions import IsSellerOrAdmin,IsAdmin
from rest_framework.generics import ListAPIView,RetrieveUpdateDestroyAPIView
from django.contrib.auth import get_user_model
User  = get_user_model()

class SellersListView(ListAPIView):
    serializer_class = UserSerializer
    permission_classes = [IsAuthenticated,IsAdmin]


    def get_queryset(self):
        return User.objects.filter(is_active=True,user_type=User.UserTypesChoices.SELLER)


class SellersActivationRequestsListView(ListAPIView):
    serializer_class = UserSerializer
    # permission_classes = [IsAuthenticated,IsAdmin]
    permission_classes = [AllowAny]
    def get_queryset(self):
        return  User.objects.filter(is_active=False,user_type=User.UserTypesChoices.SELLER)

class SellerDetailserializer(RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated,IsSellerOrAdmin]
    lookup_field = "id"

    def get_queryset(self):
        return SellerProfile.objects.all()
    def get_object(self):
        id = self.kwargs.get("id")
        obj = get_object_or_404(SellerProfile,user__id=id)
        return obj


    def get_serializer_class(self):
        user_type = self.request.user.user_type
        if user_type == User.UserTypesChoices.ADMIN:
            return SellerProfileSerializerForAdmin
        return SellerProfileSerializer



