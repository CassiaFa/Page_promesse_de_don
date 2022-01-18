from asyncio.windows_events import NULL
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
    
    # Vérification adresse et comp_adresse
    if not adresse:
        adresse = "DEFAULT" # si chaine de caractère vide attribution de None
    else:
        adresse = "'"+adresse+"'"
    
    if not comp_adresse:
        comp_adresse = "DEFAULT" # si chaine de caractère vide attribution de None
    else:
        comp_adresse = "'"+comp_adresse+"'"
    #--------------------------------------

    code_postal = request.values.get('CP')
    ville = request.values.get('ville')

    pays = request.values.get('pays')

    valeur_don = request.values.get('radio_montant')
    autre_don = request.values.get('autre_montant')
    
    # Vérification si autre_montant rempli
    if autre_don :
        valeur_don = autre_don # remplacement de don par autre_montant
    #-------------------------------------

    type_don = request.values.get('paiement')

    data.add_don(civilite, nom, prenom, mail, adresse, comp_adresse, code_postal, ville, pays, valeur_don, type_don)

    return render_template('index.html')

if __name__ == "__main__":
    app.run(debug=True, port=5001)