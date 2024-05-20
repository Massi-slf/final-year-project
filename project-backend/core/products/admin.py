from django.contrib import admin
from .models import Product, Category, ProductImage


class ProductImageInline(admin.TabularInline):
    model = ProductImage  # Use the ProductImage model
    extra = 4  # Number of extra forms to display for new images
    fields = ['image', 'caption', 'is_featured']  # Fields to display in the inline form


class ProductAdmin(admin.ModelAdmin):
    list_display = ['name', 'price', 'stock']  # Display fields in the list view
    search_fields = ['name', 'price' ]  # Optional: for easier search in the admin
    inlines = [ProductImageInline]

class CategoryAdmin(admin.ModelAdmin):
    list_display = ['name']

admin.site.register(Product, ProductAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(ProductImage)