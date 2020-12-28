from flask import Flask,render_template,request
from web_app.Web_server_operations import Web_server_operations
from web_app.User_view_class import User_view
from web_app.Message_handler import Message_Handler

app = Flask(__name__)

message_handler=Message_Handler()

@app.route('/')
@app.route('/index')
def index():
    return render_template("index.html")

@app.route('/background_process_test', methods=['GET', 'POST'])
def background_process_test():
    user_id_from_web = request.form.get('user_id')
    rec_depth=request.form.get('rec_depth')
    if(Web_server_operations.check_num(user_id_from_web) and Web_server_operations.check_num(rec_depth)):
        new_user_view=User_view(user_id_from_web, rec_depth)
        message_handler.send_message_to_node(user_id_from_web,rec_depth)
    return render_template("index.html")

app.run(host='0.0.0.0', debug = True)


