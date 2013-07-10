from django.views.generic.base import TemplateView


class HomePageTemplateView(TemplateView):
    template_name = 'home.html'
