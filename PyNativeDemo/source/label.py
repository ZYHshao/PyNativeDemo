import json
from view import *


class Label(View):
    def __init__(self, text):
        View.__init__(self)
        self.name = "Label"
        self.t = text
        self.color = ""
        self.font_size = 0
