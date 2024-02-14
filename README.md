# Quick start

## Prerequisites
* [Install `sqlite3`](https://www.servermania.com/kb/articles/install-sqlite)
  * Hint: MacOS already has `sqlite3` installed
* Python <=3.11 

## Installation

* Create a virtual environment
* Activate the virtual environment
* Install the ['required' dependencies](./requirements.txt). You can install each of the dependencies individually, but you can also use [this](https://pip.pypa.io/en/stable/cli/pip_install/#cmdoption-r).
* Open a terminal to the root of this repo and run the following command:
  * `uvicorn main:app --reload`
  * This command will create your database, if it doesn't already exist, create a web server to host your ReST API's, and automatically reload any code changes to your service.
  * Note, this command runs in the forground, so keep that terminal open or else you won't be able to test your service. 

## Post-Installation

* There are some bugs in this app that you need to resolve before you can use it. Refer to the TODOs section below for hints on how to fix them.
* Open the following URL on a browser of your choice: `http://127.0.0.1:8000/docs`
* Since all the API's are protected, you need to authenicate and authorize yourself. So create a user as the very first thing you do.


# Development

If you want to experiment, break things, and see how the ReST API's behave to changes in code,
make one change to a module, then test an API at `http://127.0.0.1:8000/docs`

# TODOs

There are bugs in this codebase that should be fixed before you can successfully run this app. If you don't fix it, you will see a 500 Internal Server Error on the GUI.

Authentication and Authorization are already implemented for you. But something
is missing. You should look into Python's [`os`](https://docs.python.org/3/library/os.html#os.getenv) library.

HINT: You need to create your own secret key that no one else should know about. You can create a secret key on your own
similar to how to create a password for any account that you create. Or you can use this command to generate a long and robust secret key: ` openssl rand -hex 32`

ANOTHER HINT: You need to choose an algorithm to use to encode your JWT tokens. Here's a [list of algorithms](https://github.com/mpdavis/python-jose/blob/master/jose/constants.py#L4) to choose from. 


Finally, there is a bug in the Authorization component. Find it and fix it so that you can use authorize a user given their role (i.e. user, admin, etc).

 
## Docker

Navigate to the root of this repo.

* Build the image: `docker build -t todo_app_test:v1 .`
* Run the container: `docker run --name myapp -p 8080:8000 todo_app_test:v1`
* Stop the container: `docker stop myapp`
* Remove the container: `docker remove myapp`




