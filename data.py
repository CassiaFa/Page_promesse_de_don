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

def lire_dons():
    global cursor

    connexion()
    query = "SELECT id_don, date_don, genre_don, nom_don, prenom_don, valeur_don, type_don FROM dons ORDER BY id_don DESC"
    cursor.execute(query)
    dons = []

    for enregistrement in cursor :
        don = {}
        don['id'] = enregistrement[0]
        don['date'] = enregistrement[1]
        don['genre'] = enregistrement[2]
        don['nom'] = enregistrement[3]
        don['prenom'] = enregistrement[4]
        don['valeur'] = enregistrement[5]
        don['reglement'] = enregistrement[6]
        dons.append(don)

    query = "SELECT SUM(valeur_don) FROM Dons"

    cursor.execute(query)

    # for i in cursor:
    cagnote = cursor.fetchone()[0]

    deconnexion()

    return dons, cagnote

# def get_post(id):
#     global cursor

#     connexion()
#     query = "SELECT * FROM posts WHERE id=" + str(id)
#     cursor.execute(query)
#     post = {}

#     for enregistrement in cursor :
#         post['id'] = enregistrement[0]
#         post['created'] = enregistrement[1]
#         post['title'] = enregistrement[2]
#         post['content'] = enregistrement[3]

#     deconnexion()
#     return post

def add_don(civilite, nom, prenom, mail, adresse, comp_adresse, code_postal, ville, pays, valeur_don, type_don):
    global bdd
    global cursor
    
    connexion()
    query = "INSERT INTO dons(date_don, genre_don, nom_don, prenom_don, mail_don, adress_don, compa_don, cp_don, ville_don, pays_don, valeur_don, type_don) VALUES (CURRENT_DATE, '"+civilite+"','"+nom+"','"+prenom+"','"+mail+"',"+adresse+","+comp_adresse+",'"+code_postal+"','"+ville+"','"+pays+"','"+valeur_don+"','"+type_don+"');"

    cursor.execute(query)
    bdd.commit()
    deconnexion()

def check_user(login, mdp):
    global cursor

    connexion()
    query = "SELECT nom_libelle FROM libelles NATURAL JOIN utilisateurs WHERE login_utilisateur='"+login+"' AND mdp_utilisateur='"+mdp+"';"

    cursor.execute(query)
    
    droit = cursor.fetchone()
    if droit != None:
        droit = droit[0]

    deconnexion()

    return droit