from starlette.exceptions import HTTPException


def check_user_authentication(user):
    if user is None:
        raise HTTPException(status_code=401, detail='Authentication Failed')
