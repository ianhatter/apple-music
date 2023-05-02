from flask import Blueprint, jsonify, abort, request
from .models import Song, User, db

bp = Blueprint("songs", __name__, url_prefix="/songs")


@bp.route("", methods=["GET"])  # decorator takes path and list of HTTP verbs
def index():
    songs = Song.query.all()  # ORM performs SELECT query
    result = []
    for s in songs:
        result.append(s.serialize())  # build list of Tweets as dictionaries
    return jsonify(result)  # return JSON response


@bp.route("/<int:id>", methods=["GET"])
def show(id: int):
    s = Song.query.get_or_404(id)
    return jsonify(s.serialize())


@bp.route("", methods=["POST"])
def create():
    # req body must contain user_id and content
    if "user_id" not in request.json or "content" not in request.json:
        return abort(400)

    # user with id of user_id must exist
    User.query.get_or_404(request.json["user_id"])

    # construct Tweet
    s = Song(user_id=request.json["user_id"], content=request.json["content"])

    db.session.add(s)  # prepare CREATE statement
    db.session.commit()  # execute CREATE statement

    return jsonify(s.serialize())


@bp.route("/<int:id>", methods=["DELETE"])
def delete(id: int):
    s = Song.query.get_or_404(id)
    try:
        db.session.delete(s)  # prepare DELETE statement
        db.session.commit()  # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)


@bp.route("/<int:id>/playlist_songs", methods=["GET"])
def playlist_users(id: int):
    s = Song.query.get_or_404(id)
    result = []
    for u in s.playlist_users:
        result.append(u.serialize())
    return jsonify(result)
