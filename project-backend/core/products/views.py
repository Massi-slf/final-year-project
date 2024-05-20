from rest_framework.generics import ListAPIView, RetrieveAPIView,ListCreateAPIView,RetrieveUpdateDestroyAPIView
from .models import Product,Category
from rest_framework.permissions import AllowAny
from .serializers import BasicProductSerializer, DetailedProductSerializer,CategoryManagerSerializer
from common.permissions    import IsAdmin


class ProductsAddListView(ListAPIView):
    queryset = Product.objects.all()
    permission_classes = [AllowAny]
    serializer_class = BasicProductSerializer

class DetailedProductView(RetrieveAPIView):
    permission_classes = [AllowAny]
    queryset = Product.objects.all()
    lookup_field = 'slug'
    serializer_class = DetailedProductSerializer

class CategoryListCreateManagerView(ListCreateAPIView):
    queryset = Category.objects.all()
    permission_classes = [AllowAny,IsAdmin]
    serializer_class = CategoryManagerSerializer
class CategoryUpdateDeleteView(RetrieveUpdateDestroyAPIView):
    queryset = Category.objects.all()
    permission_classes = [AllowAny]
    lookup_field = 'id'
    serializer_class = CategoryManagerSerializer