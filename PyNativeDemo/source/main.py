'''
生命周期函数：
render: 返回View对象 渲染页面
'''

from label import *
from view import *


class Main(View):
    def __init__(self):
        View.__init__(self)
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

        self.addSubView(l)
        self.addSubView(l2)
        self.background_color = "purple"
        self.width = 400
        self.height = 500
        self.top = 10
