import json


class View():
    def __init__(self):
        self.name = "View"
        self.left = 0
        self.top = 0
        self.width = 0
        self.height = 0
        self.background_color = ""
        self.sub_views = []

    def addSubView(self, view):
        self.sub_views.append(view.__dict__)

    def render(self):
        return json.dumps(self.__dict__)
