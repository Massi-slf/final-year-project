from django.db import models
import os
from common.base_model import BaseModel
from sellers.models import SellerProfile
from django.core.validators import MaxValueValidator,MinValueValidator

# Create your models here.
class Category(BaseModel):
    name = models.CharField(max_length=100,unique=True)
    parent = models.ForeignKey("self",null=True,blank=True,on_delete=models.CASCADE,related_name='children')
    def __str__(self) -> str:
        return self.name
    
class Product(BaseModel):
    name = models.CharField(max_length=300)
    description = models.TextField()
    price = models.DecimalField(max_digits=10,decimal_places=2)
    category = models.ForeignKey(Category,related_name='products',on_delete=models.CASCADE)
    quintity = models.PositiveIntegerField(default=1)

    def featured_image(self):
        featured = self.images.fitler(is_featured=True).first()
        if featured:
            return featured
        return self.image.first()

    def __str__(self) -> str:
        return self.name
class ProductCoupon(BaseModel):
    code = models.CharField(max_length=49, unique=True)
    discount = models.PositiveIntegerField(validators=[MinValueValidator(1),MaxValueValidator(100)])
    seller = models.ForeignKey(SellerProfile,related_name="generated_coupons",on_delete=models.CASCADE)
    product = models.ForeignKey(Product,related_name="coupons",on_delete=models.CASCADE)
    expiry_date = models.DateTimeField()
def product_image_uploader(instance, filename):
    return os.path.join("products", str(instance.product.id), filename)
class ProductImage(BaseModel):
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='images')
    image = models.ImageField(upload_to=product_image_uploader,max_length=500)  
    caption = models.CharField(max_length=255, blank=True, null=True)
    is_featured = models.BooleanField(default=False)
    def __str__(self):
        return f"{self.product.name} - {self.caption if self.caption else 'Image'}"