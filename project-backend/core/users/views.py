from rest_framework.generics import CreateAPIView, RetrieveUpdateAPIView
from rest_framework.mixins import Response
from rest_framework.permissions import AllowAny

from .models import MyUser as User
from .serializers import (
    # UserProfileSerializer,
    UserRegistrationSerializer,

)


class UserRegistrationView(CreateAPIView):
    serializer_class = UserRegistrationSerializer
    permission_classes = [AllowAny]







# class UserProfileUpdateRetrieveView(RetrieveUpdateAPIView):

#     def get_object(self):
#         user_type = self.request.user.user_type
#         if user_type == User.UserTypesChoices.CLIENT:
#             user_profile = self.request.user.user_profile
#             return user_profile
#         elif user_type == User.UserTypesChoices.SELLER:
#             seller_profile = self.request.user.seller_profile
#             return seller_profile
#         return None

#     def get_serializer_class(self):
#         user_type = self.request.user.user_type
#         if user_type == User.UserTypesChoices.CLIENT:
#             return UserProfileSerializer
#         elif user_type == User.UserTypesChoices.SELLER:
#             return SellerProfileSerializer
#         return None  # Handle other cases or raise appropriate error

#     def retrieve(self, request, *args, **kwargs):
#         instance = self.get_object()
#         serializer = self.get_serializer(instance)
#         return Response(serializer.data)
