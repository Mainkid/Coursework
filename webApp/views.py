from flask import render_template
from webApp import webApp

@webApp.route('/')
@webApp.route('/index')
def index():
    user = { 'nickname': 'Miguel' } # выдуманный пользователь
    return render_template("index.html", title='Home', user=user)