
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate

# https://flask.palletsprojects.com/en/2.0.x/patterns/appfactories/

db = SQLAlchemy()

app = Flask(__name__, instance_relative_config=True)
app.config.from_mapping(
    SECRET_KEY="dev",
    SQLALCHEMY_DATABASE_URI="postgresql://postgres@localhost:5432/my_apple_music",
    SQLALCHEMY_TRACK_MODIFICATIONS=False,
    SQLALCHEMY_ECHO=True,
)
db.init_app(app)
migrate = Migrate(app, db)


class User(db.Model):
    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(128), unique=True, nullable=False)
    password = db.Column(db.String(128), nullable=False)
