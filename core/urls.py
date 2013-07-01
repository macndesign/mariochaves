from django.conf.urls import patterns, url
from .views import HomePageTemplateView

urlpatterns = patterns('',
    url(r'^$', HomePageTemplateView.as_view(), name='home'),
)
