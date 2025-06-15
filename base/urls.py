from django.urls import path
from .views.base_views import index

urlpatterns = [
    path('', index, name='index'),
] 