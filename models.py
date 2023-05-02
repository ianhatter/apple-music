from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class User(db.Model):
    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    age = db.Column(db.String(128), nullable=False)
    user_name = db.Column(db.String(128), unique=True, nullable=False)

    def __init__(self, user_name: str, age: int):
        self.user_name = user_name
        self.age = age

    def serialize(self):
        return {
            "id": self.id,
            "user_name": self.user_name,
            "age": self.age

        }


class Song(db.Model):
    __tablename__ = "songs"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String(280), nullable=False)
    song_minutes = db.Column(db.String(128), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey("users.id"), nullable=False)

    def __init__(self, title: str, song_minutes: str):
        self.title = title
        self.song_minutes = song_minutes

    playlist_users = db.relationship(
        "User",
        secondary=playlist_songs_table,
        lazy="subquery",
        backref=db.backref("playlist_songs", lazy=True),
    )

    def serialize(self):
        return {
            "id": self.id,
            "title": self.title,
            "song_minutes": self.song_minutes,
            "user_id": self.user_id,
        }
