from django.contrib.auth import get_user_model
from rest_framework import serializers
User = get_user_model()



class AuthenticatedUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'is_active',"user_type"]
