from flask import Blueprint, jsonify, abort, request
from .models import User, db, Song,
import hashlib
import secrets


bp = Blueprint("users", __name__, url_prefix="/users")


@bp.route("", methods=["GET"])
def index():
    users = User.query.all()
    result = []
    for u in users:
        result.append(u.serialize())
    return jsonify(result)


@bp.route("/<int:id>", methods=["GET"])
def show(id: int):
    u = User.query.get_or_404(id)
    return jsonify(u.serialize())


@bp.route("", methods=["POST"])
def create():
    # req body must contain user_id and content
    if "username" not in request.json:
        return abort(400)

    if len(request.json["username"]) < 3:
        return abort(400)

    if len(request.json["password"]) < 8:
        return abort(400)

    u = User(
        username=request.json["username"]
    )

    db.session.add(u)  # prepare CREATE statement
    db.session.commit()  # execute CREATE statement

    return jsonify(u.serialize())


@bp.route("/<int:id>", methods=["DELETE"])
def delete(id: int):
    u = User.query.get_or_404(id)
    try:
        db.session.delete(u)  # prepare DELETE statement
        db.session.commit()  # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)


@bp.route("/<int:id>", methods=["PATCH", "PUT"])
def update(id: int):
    u = User.query.get_or_404(id)
    if "username" not in request.json or "password" not in request.json:
        return abort(400)

    if "username" in request.json:
        if len(request.json["username"]) < 3:
            return abort(400)
        if len(request.json["username"]) >= 3:
            u.username = request.json["username"]
    try:
        db.session.commit()
        return jsonify(u.serialize())
    except:
        return jsonify(False)
