import json
from label import *

class Main():
    def application_Launch(self):
        pass

    def render_main_view(self):
        l = Label("HelloWorld")
        l.color = "red"
        l.font_size = 21
        l.background_color = "white"
        l.left = 100
        l.top = 100
        l.width = 200
        l.height = 30
        
        l2 = Label("hhahha")
        l2.color = "red"
        l2.font_size = 21
        l2.background_color = "white"
        l2.left = 100
        l2.top = 300
        l2.width = 200
        l2.height = 30
        return json.dumps({
            "color": "purple",
            "subViews": [l.render(), l2.render()]
        })
