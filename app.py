from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/")
def index():
    return render_template('index.html')

@app.route('/don')
def don():
    return render_template('faire_don.html')

@app.route('/contact')
def contact():
    return render_template('contact.html')

# @app.route('/bonjour/<name>')
# def bonjour(name):
#     return render_template('bonjour.html', quelquun=name)

if __name__ == "__main__":
    app.run(debug=True, port=5001)