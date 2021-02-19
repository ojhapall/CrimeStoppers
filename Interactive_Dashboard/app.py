from flask import Flask, render_template, redirect, url_for, request
import pickle
import os
import pandas as pd
from dateutil import parser
from fbprophet import Prophet

file = ('/Users/pallaviojha/CrimeStoppers/Interactive_Dashboard/model.pkl')

with open(file, 'rb') as handle:
    model = pickle.load(handle)

app = Flask(__name__,template_folder='templates')



@app.route("/", methods=['GET'])
def results():
    date = request.form['ds']

        # get_date = parser.parse(request.form.get('Date'))

        # return (render_template("index.html"))
    
    if request.method == 'GET':
        # model = get_model()

        prediction = model.predict('2020-01-01')

        return render_template('index.html', 
            original_input={'Date':date},
            results = prediction,
            )

if __name__ == "__main__":
    app.run()