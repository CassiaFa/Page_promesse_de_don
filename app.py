from flask import Flask, render_template, request
import data

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

@app.route('/add', methods=['POST'])
def add():
    civilite = request.values.get('genre')
    nom = request.values.get('nom')
    prenom = request.values.get('prenom')
    mail = request.values.get('mail')

    adresse = request.values.get('adresse')
    comp_adresse = request.values.get('compa')

    code_postal = request.values.get('CP')
    ville = request.values.get('ville')

    pays = request.values.get('pays')

    valeur_don = request.values.get('radio_montant')
    type_don = request.values.get('paiement')

    data.add_don(civilite, nom, prenom, mail, adresse, comp_adresse, code_postal, ville, pays, valeur_don, type_don)

    return render_template('index.html')

if __name__ == "__main__":
    app.run(debug=True, port=5001)