from django.db import models
from common.base_model import BaseModel
from django.contrib.auth import get_user_model
from django.db.models.base import post_save
from django.dispatch import receiver

User = get_user_model()

# Create your models here.


class ClientProfile(BaseModel):
    user = models.ForeignKey(
        User, related_name="client_profile", on_delete=models.CASCADE
    )
    def str(self)->str:
        return str(self.user)


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        if instance.user_type == User.UserTypesChoices.CLIENT:
            ClientProfile.objects.get_or_create(user=instance)