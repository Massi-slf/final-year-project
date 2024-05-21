from common.base_model import BaseModel
from django.contrib.auth.models import AbstractUser, BaseUserManager, PermissionsMixin
from django.db import models



class MyUserManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError("The Email field must be set")
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_active", True)

        extra_fields.setdefault("is_superuser", True)
        extra_fields.setdefault("user_type", MyUser.UserTypesChoices.ADMIN)

        if extra_fields.get("is_staff") is not True:
            raise ValueError("Superuser must have is_staff=True.")
        if extra_fields.get("is_superuser") is not True:
            raise ValueError("Superuser must have is_superuser=True.")

        return self.create_user(email, password, **extra_fields)


class MyUser(AbstractUser, PermissionsMixin, BaseModel):

    class UserTypesChoices(models.TextChoices):
        CLIENT = "client"
        ADMIN = "admin"
        SELLER = "seller"

    first_name = models.CharField("first name", max_length=200, blank=True)
    last_name = models.CharField("last name", max_length=200, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_active = models.BooleanField("active", default=True)
    is_staff = models.BooleanField("is staff", default=False)

    user_type = models.CharField(
        max_length=20, choices=UserTypesChoices.choices, default=UserTypesChoices.CLIENT
    )
    email = models.EmailField("email address", unique=True)

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ()

    username = models.CharField(
        max_length=100,
        unique=True,
        null=True,
        blank=True,
    )

    def is_client(self):
        return self.user_type == MyUser.UserTypesChoices.CLIENT

    def is_admin(self):
        return self.user_type == MyUser.UserTypesChoices.ADMIN

    def is_seller(self):
        return self.user_type == MyUser.UserTypesChoices.SELLER

    objects = MyUserManager()

    def __str__(self):
        return self.email


