from django.db import models
from common.base_model import BaseModel
from django.contrib.auth import get_user_model
from django.db.models.base import post_save
from django.dispatch import receiver

User  = get_user_model()

# Create your models here.

class SellerProfile(BaseModel):
    user = models.ForeignKey(
        User, related_name="seller_profile", on_delete=models.CASCADE
    )
    is_active = models.BooleanField(default=False)




@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        if instance.user_type == User.UserTypesChoices.SELLER:
            SellerProfile.objects.get_or_create(user=instance)