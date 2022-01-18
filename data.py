import mysql.connector as mysqlpyth

bdd = None
cursor = None

def connexion():
    global bdd
    global cursor

    bdd = mysqlpyth.connect(user='admin_asso', password='mdp', host='localhost', port="8081", database='Test_don')
    cursor = bdd.cursor()

def deconnexion():
    global bdd
    global cursor

    cursor.close()
    bdd.close()

def add_don(civilite, nom, prenom, mail, adresse, comp_adresse, code_postal, ville, pays, valeur_don, type_don):
    global bdd
    global cursor
    
    connexion()
    query = "INSERT INTO dons(genre_don, nom_don, prenom_don, mail_don, adress_don, compa_don, cp_don, ville_don, pays_don, valeur_don, type_don) VALUES ('"+civilite+"','"+nom+"','"+prenom+"','"+mail+"',"+adresse+","+comp_adresse+",'"+code_postal+"','"+ville+"','"+pays+"','"+valeur_don+"','"+type_don+"');"

    cursor.execute(query)
    bdd.commit()
    deconnexion()