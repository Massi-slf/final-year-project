from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin

from .forms import UserCreationForm
from .models import MyUser

User = get_user_model()


class CustomUserAdmin(UserAdmin):
    add_form = UserCreationForm
    model = User
    list_display = (
        "email",
        "user_type",
        "username",
        "first_name",
        "last_name",
        "is_active",
        "is_superuser",
        "created_at",
        "updated_at",
    )
    list_filter = ("is_active", "is_superuser")
    search_fields = ("email", "first_name", "last_name")
    readonly_fields = ("created_at", "updated_at", "last_login")
    fieldsets = (
        (None, {"fields": ("email", "password")}),
        (
            "Personal Info",
            {"fields": ("first_name", "last_name")},
        ),
        (
            "Permissions",
            {"fields": ("is_active", "is_staff", "is_superuser", "user_type")},
        ),
        ("Important dates", {"fields": ("last_login", "created_at", "updated_at")}),
    )
    add_fieldsets = (
        (
            None,
            {
                "classes": ("wide",),
                "fields": (
                    "email",
                    "password",
                    "password2",
                    "first_name",
                    "last_name",
                    "user_type",
                ),
            },
        ),
    )

    # Remove or update the ordering attribute
    ordering = ("email",)






admin.site.register(MyUser, CustomUserAdmin)
