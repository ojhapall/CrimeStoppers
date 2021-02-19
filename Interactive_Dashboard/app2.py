from flask import Flask, render_template, redirect, url_for, request
import pickle
import os
import numpy as np
import pandas as pd
from dateutil import parser
from fbprophet import Prophet
import io
import datetime

file = ('/Users/pallaviojha/CrimeStoppers/Interactive_Dashboard/model.pkl')

with open(file, 'rb') as handle:
    model = pickle.load(handle)

app = Flask(__name__,template_folder='templates')

@app.route('/predict/') # Use URL http://localhost:5000/predict/?date=2020-01-01 to access html after starting server.
#@app.route('/predict/<date>')
def hello():
    date = request.args.get("date")
    
#def hello(date=None):
    d =  {"ds" : [date]}
    print(date)
    df = pd.DataFrame(d)
    print(df)

    #date_object = datetime.datetime.strptime(date, '%Y-%m-%d')

    prediction = model.predict(df)
    print(prediction)

    ret_prediction = str(prediction['yhat'].iloc[0])
    print(ret_prediction)

    return render_template('index.html', date=ret_prediction)
 
if __name__ == "__main__":
    app.run()
    

#@app.route('/post/<input_date>')
#def show_post(input_date):

    #if request.method == 'GET':
        #print(input_date)


        #return render_template('hello.html', 
            #name=input_date,
            #results = {str(prediction['yhat'].iloc[0])},
            #)

    #return prediction['yhat'].to_json()
#file = ('/Users/pallaviojha/CrimeStoppers/Interactive_Dashboard/test.csv')
#df = pd.date_range("20200101", periods=1)
#df = pd.read_csv(file)

