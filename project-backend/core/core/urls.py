from django.conf import settings
from django.contrib import admin
from django.urls import include, path
from django.conf.urls.static import static

urlpatterns = [
    path("admin/", admin.site.urls),
    path('', include('admin_volt.urls')),
    path("api/jwt/", include("login.urls")),
    path("api/users/", include("users.urls")),
    path("api/products/", include("products.urls")),
    path("api/sellers/", include("sellers.urls")),
    path("api/clients/", include("clients.urls")),

]



if settings.DEBUG:
    urlpatterns += [
        path("api-auth/", include("rest_framework.urls", namespace="rest_framework"))
    ]
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
