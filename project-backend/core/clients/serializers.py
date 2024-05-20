

from rest_framework import serializers
from users.serializers import UserSerializer
from .models import ClientProfile




class ClientSerialize(serializers.ModelSerializer):
    is_active = serializers.BooleanField(write_only=True,required=False)
    user = UserSerializer(read_only=True)
    class Meta:
        model  = ClientProfile
        fields = ["id","user","is_active","created_at","updated_at"]


class ClientManagerSerializer(ClientSerialize):
    
    def update(self,instance,validated_data):
        instance.user.is_active = validated_data.get("is_active",instance.user.is_active)
        instance.user.save()
        instance.save()
        return instance
    
