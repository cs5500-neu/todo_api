# Quick start

## Prerequisites
* [Install `sqlite3`](https://www.servermania.com/kb/articles/install-sqlite)
  * Hint: MacOS already has `sqlite3` installed
* Python <=3.11 (do not use 3.12 or above)

## Installation

* Create a virtual environment
* Activate the virtual environment
* Install the ['required' dependencies](./requirements.txt). You can install each of the dependencies individually, but you can also use [this](https://pip.pypa.io/en/stable/cli/pip_install/#cmdoption-r).
* Open a terminal to the root of this repo
* Set your PYTHONPATH to the root of this repo so that custom modules can be read. Run the following command:
  * `export PYTHONPATH=$(pwd):$PYTHONPATH` 
* Navigate to the `app` folder and run the following command:
  * `uvicorn main:app --reload`
  * This command will create your database, if it doesn't already exist, create a web server to host your ReST API's, and automatically reload any code changes to your service.
  * Note, this command runs in the forground, so keep that terminal open or else you won't be able to test your service. 

## Post-Installation


* Open the following URL on a browser of your choice: `http://127.0.0.1:8000/docs`
* Since all the API's are protected, you need to authenicate and authorize yourself. So create a user with role set to `Admin`. Then login as the user by clicking on one of the keylock icons.
* There are some bugs in this app that you need to resolve before you can use it. Refer to the TODOs section below for hints on how to fix them.

# TODOs

There are two bugs in this codebase that should be fixed before you can successfully run this app. If you don't fix it, you will see a 500 Internal Server Error on the GUI.

1. Did you try logging in as your new user? Did you notice that it failed? Authentication and Authorization are already implemented for you. But something
is missing. Perhaps it could be something with your 'environment'? You should look into Python's [`os`](https://docs.python.org/3/library/os.html#os.getenv) library.

HINT1: You need to create your own secret key that no one else should know about. You can create a secret key on your own
similar to how to create a password for any account that you create. Or you can use this command to generate a long and robust secret key: ` openssl rand -hex 32`

HINT2: You need to choose an algorithm to use to encode your JWT tokens. Here's a [list of algorithms](https://github.com/mpdavis/python-jose/blob/master/jose/constants.py#L4) to choose from. 

HINT3: Look at the logs in your terminal for some clues on what's wrong. 

HINT4: If you're still stuck, look at this [line of code](https://github.com/cs5500-neu/todo_api/blob/main/app/routers/auth.py#L100) and verify the data definitions of any and all variables.

2. Open your browser to `http://127.0.0.1:8000/docs` and test one of the API's designated for `Admin` users (make sure you are logged in with your user and that your user has 'Admin' set as a role). Notice that the Admin API's are not working. There is a bug in the Authorization component. Find it and fix it so that you can use authorize a user given their role (e.g. Admin).

HINT1: How does the system check the role of a user?

HINT2: Still stuck? Look for some module with the word `admin` in it. 


# Development

If you want to experiment, break things, and see how the ReST API's behave to changes in code,
make one change to a module, then test an API at `http://127.0.0.1:8000/docs`


## Docker

Navigate to the root of this repo.

* Build the image: `docker build -t todo_app_test:v1 .`
* Run the container: `docker run --name myapp -p 8080:8000 todo_app_test:v1`
* Stop the container: `docker stop myapp`
* Remove the container: `docker remove myapp`




