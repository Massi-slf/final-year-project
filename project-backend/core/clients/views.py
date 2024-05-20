from django.shortcuts import render
from rest_framework.generics import ListAPIView
from .serializers import ClientManagerSerializer
from users.serializers import UserSerializer
from common.permissions import IsAdmin
from django.contrib.auth import get_user_model
from rest_framework.generics import RetrieveUpdateDestroyAPIView  
from .models import ClientProfile
from django.shortcuts import get_object_or_404
from rest_framework.response import Response
from rest_framework import status

User  = get_user_model()


class ClientsListView(ListAPIView):
    serializer_class = UserSerializer
    permission_classes = [IsAdmin]
    def get_queryset(self):
        return User.objects.filter(user_type=User.UserTypesChoices.CLIENT)

class ClientManagerView(RetrieveUpdateDestroyAPIView):
    serializer_class = ClientManagerSerializer
    queryset = ClientProfile.objects.all()
    lookup_field = "id"
    permission_classes = [IsAdmin]
    def get_object(self):
        user_id = self.kwargs.get("id")
        print(user_id)
        return get_object_or_404(ClientProfile,user__id=self.kwargs.get("id"))
    def destroy(self, request, *args, **kwargs):
        ## we just need to delete the user the client profile will be deleted automatically
        ## because of we seated on_delete=models.CASCADE in the ClientProfile model
        client = self.get_object()
        client.user.delete()
        return Response({"detail":"Client Deleted Successfully"},status=status.HTTP_204_NO_CONTENT)
