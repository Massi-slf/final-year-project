# Generated by Django 5.0.2 on 2024-04-21 21:34

import products.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0002_rename_is_feautred_productimage_is_featured_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='productimage',
            name='image',
            field=models.ImageField(max_length=500, upload_to=products.models.product_image_uploader),
        ),
    ]
