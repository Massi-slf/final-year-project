from django.contrib import admin
from .models import ClientProfile

# Register your models here.

class ClientProfileAdmin(admin.ModelAdmin):
    list_display = ("user",)
    search_fields = ()
admin.site.register(ClientProfile, ClientProfileAdmin)
