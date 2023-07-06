# This file is part of https://github.com/jainamoswal/Flask-Example.
# Usage covered in <IDC lICENSE>
# Jainam Oswal. <jainam.me> 


# Import Libraries 
from app import app

# Define route "/" & "/<name>"
@app.route("/")
@app.route("/<name>")
def index(name='Anonymous'):
    return f"Version v2.0.0 Hello {name}!!"
