from flask import render_template, request
from web_app import app_start
from web_app.Web_server_operations import Web_server_operations
from web_app.User_view_class import  User_view

query=[]

@app_start.app.route('/')
@app_start.app.route('/index')
def index():
    return render_template("index.html")

@app_start.route('/background_process_test', methods=['GET', 'POST'])
def background_process_test():
    user_id_from_web = request.form.get('user_id')
    rec_depth=request.form.get('rec_depth')
    if(Web_server_operations.check_num(user_id_from_web) and Web_server_operations.check_num(rec_depth)):
        new_user_view=User_view(user_id_from_web,rec_depth)
        views.query.append(new_user_view)
    return render_template("index.html")
