from django.contrib import admin
from .models import SellerProfile

# Register your models here.

class SellerProfileAdmin(admin.ModelAdmin):
    list_display = ("user",)
    # search_fields = ()

admin.site.register(SellerProfile, SellerProfileAdmin)
