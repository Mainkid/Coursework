from flask import Flask,render_template,request,flash
from web_app.Web_server_operations import Web_server_operations
from web_app.User_view_class import User_view
from web_app.Message_handler import Message_Handler
from web_app.web_DB.entities.Stats import Stats
from web_app.web_DB.startDB import startDB
from web_app.web_DB.entities.Tokens import Tokens
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.exc import IntegrityError

message_handler=Message_Handler()
app = Flask(__name__)
app.config['SECRET_KEY'] = 'qfafsqetgl21375v'

@app.route('/', methods=['POST','GET'])
@app.route('/index', methods=['POST','GET'])
def index():
    args = {"method": "GET"}
    print(request.form.get('okbutton'))
    if request.method == "POST":
        user_id_from_web = request.form.get('user_id')
        rec_depth = request.form.get('rec_depth')
        if (Web_server_operations.check_num(user_id_from_web) and Web_server_operations.check_num(rec_depth)) and (int(rec_depth) <= 5 and int(rec_depth) >= 0 and int(user_id_from_web) > 0):
            flash('Пользователь отправлен', category='success')
            new_user_view = User_view(user_id_from_web, rec_depth)
            message_handler.send_message_to_node(user_id_from_web, rec_depth)
            args["method"] = "POST"
        else:
            flash('Ошибка! Пожалуйста, проверьте введенные данные.', category='error')
            args["method"] = "POST"
    return render_template("index.html", args=args)


@app.route("/download_tokens", methods=["POST", "GET"])
def download_tokens():
    args = {"method": "GET"}
    if request.method == "POST":
        file = request.files["file"]
        token = request.form.get('token')
        if bool(file.filename)and ('.txt' in file.filename):
            file_bytes = file.read(1024 * 1024 + 1)
            args["file_size_error"] = len(file_bytes) == 1024 * 1024 + 1
            flash('Файл отправлен', category='success')
            try:
                text = file_bytes.decode('utf-8')
                token_list = text.split('\r\n')
                for token in token_list:
                    add_tokens_to_db(token)
            except:
                print('ERROR occured while sending token!')
        elif bool(file.filename) and ('.txt' not in file.filename):
            flash('Ошибка при чтении файла. Убедитесь, что файл в формате .txt', category='error')
        if token!="":
            add_tokens_to_db(token)
        args["method"] = "POST"
    return render_template("download_tokens.html", args=args)

@app.route("/download_id", methods=["POST", "GET"])
def download_id():
    args = {"method": "GET"}
    if request.method == "POST":
        file = request.files["file"]
        user_id_from_web = request.form.get('user_id')
        rec_depth = request.form.get('rec_depth')
        if bool(file.filename) and ('.txt' in file.filename):
            file_bytes = file.read(1024 * 1024 + 1)
            args["file_size_error"] = len(file_bytes) == 1024 * 1024 + 1
            message_handler.send_message_id(file_bytes)
            flash('Файл успешно загружен!', category='success')
        elif bool(file.filename) and ('.txt' not in file.filename):
            flash('Ошибка при чтении файла. Убедитесь, что файл в формате .txt', category='error')
        if (rec_depth != '' and user_id_from_web!= '' and int(rec_depth) <= 5 and int(rec_depth) >= 0 and int(
                user_id_from_web) > 0):
            new_user_view = User_view(user_id_from_web, rec_depth)
            message_handler.send_message_to_node(user_id_from_web, rec_depth)
        args["method"] = "POST"
    return render_template("download_id.html", args=args)

@app.route("/stats", methods=["POST", "GET"])
def stats():
    args = {"method": "GET"}
    x = startDB.session.query(Stats).get(1)
    labels = ['Успешно собрано','Не собрано' ]
    values = [x.successfully, x.failed ]
    colors = [
        "#F7464A", "#46BFBD", "#FDB45C", "#FEDCBA",
        "#ABCDEF", "#DDDDDD", "#ABCABC", "#4169E1",
        "#C71585", "#FF4500", "#FEDCBA", "#46BFBD"]
    return render_template('stats.html', args=args,values=values,colors=colors,labels=labels,max=max(values))

def add_to_db():
    stat=Stats(1,1)
    startDB.session.add(stat)
    startDB.session.commit()

def add_tokens_to_db(token_val):
    token=Tokens(token_val)
    if not check_token(token_val):
        startDB.session.add(token)
        startDB.session.commit()
        message_handler.send_message(token_val,'token_query')

def check_token(token_val):
    try:
        get_token_by_query = startDB.session.query(Tokens.token).filter(Tokens.token == token_val).one()
        if get_token_by_query.token ==token_val:
            return True
        else:
            return False
    except IntegrityError as err:
        return False
    except SQLAlchemyError as err:
        return False

def put_tokens_to_query():
    try:
        get_token_by_query = startDB.session.query(Tokens.token).all()
        for token in get_token_by_query:
            message_handler.send_message(token[0],'token_query')
    except IntegrityError as err:
        return
    except SQLAlchemyError as err:
        return

def add_stats():
    if not check_stats():
        stat=Stats(0,0)
        startDB.session.add(stat)
        startDB.session.commit()


def check_stats():
    try:
        get_stats= startDB.session.query(Stats.id).filter(Stats.id== 1).one()
        return True
    except IntegrityError as err:
        return False
    except SQLAlchemyError as err:
        return False

if __name__=='__main__':

    startDB.connect()
    qwe=123
    q=startDB.session
    add_stats()
    app.run(host='0.0.0.0', debug = True)
