import json

class Label:
    def __init__(self, text):
        self.t = text
        self.color = ""
        self.left = 0
        self.top = 0
        self.width = 0
        self.height = 0
        self.font_size = 0
        self.background_color = ""
    
    def render(self):
        return json.dumps({
            "name": "Label",
            "t": self.t,
            "color": self.color,
            "left": self.left,
            "top": self.top,
            "width": self.width,
            "height": self.height,
            "font_size": self.font_size,
            "background_color": self.background_color
        })
