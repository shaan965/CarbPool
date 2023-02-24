import flask
from flask_restful import Resource, Api, reqparse
from pymongo import MongoClient

app = flask.Flask("CarbPool")
api = Api(app)


def Load():
    # driver code
    Port = input("Please enter a port: ")
    if not Port.isnumeric():
        print("Invalid port, try again")
        Load()
        return
    client = MongoClient('localhost', int(Port))

    db = client["Hackathon"]
    return db

db = Load()

class Login(Resource):
    def __init__(self):
        self.parser = reqparse.RequestParser()
        self.parser.add_argument('username',type=str,required=True)
        self.parser.add_argument('password',type=str,required=True)

    def post(self):
        args = self.parser.parse_args()
        username = args['username']
        password = args['password']
        
        print(username, password)
        Info = db["LoginInfo"].find({"username":username,"password":password})
        if len(Info) >= 1:
            response = {"success": True}
            return flask.make_response(flask.jsonify(response), 200)
        else:
            response = {"success": False, "message": "Invalid username or password"}
            return flask.make_response(flask.jsonify(response), 401)

class Register(Resource):
    def __init__(self):
        self.parser = reqparse.RequestParser()
        self.parser.add_argument('username',type=str,required=True)
        self.parser.add_argument('password',type=str,required=True)
        self.parser.add_argument('age',type=int,required=True)
        self.parser.add_argument('address',type=str,required=True)
        self.parser.add_argument('phone_number',type=str,required=True)
        self.parser.add_argument('lisence', type=werkzeug.datastructures.FileStorage, location='files')


    def post(self):
        args = self.parser.parse_args()
        username = args['username']
        password = args['password']
        age = args['age']
        Info = db["LoginInfo"].find({"username":username})

        if len(password) <= 3:
            response = {"success": False, "message": "Password is too short!"}
            return flask.make_response(flask.jsonify(response), 401)
        
        if not password.isalnum() or not username.isalnum():
            response = {"success": False, "message": "Passwords and usernames must be alphanumeric"}
            return flask.make_response(flask.jsonify(response), 401)
        
        if age < 18:
            response = {"success": False, "message": "Age must be greater than 18!"}
            return flask.make_response(flask.jsonify(response), 401)

        if len(Info) >= 1:
            response = {"success": False, "message": "Username is already taken!"}
            return flask.make_response(flask.jsonify(response), 401)
        else:
            address = args['address']
            phone_number = args['phone_number']

            lisence = args['lisence']
            image_data = lisence.read()

            db["LoginInfo"].insert_one({'username':username,'password':password})
            db["UserInfo"].insert_one({'username':username,'age':age,'address':address,'phone_number':phone_number,'lisence':image_data})
            response = {"success": True}
            return flask.make_response(flask.jsonify(response), 200)



api.add_resource(Login,"/login")

app.run()
