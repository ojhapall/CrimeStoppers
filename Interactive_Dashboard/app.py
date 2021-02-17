import flask
import pickle

with open(f'Model/Machine_Learning_Model_FINAL.obj') as f:
    model = pickle.load(f)

app = flask.Flask(__name__,template_folder='templates')

@app.route("/", methods=['GET','POST'])
def main():
    if flask.request.method == 'GET':
        return (flask.render_template("index.html"))
    
    if flask.request.method == 'POST':
        date = flask.request.form['ds']
    
        input_variables =  pd.DataFrame(temp_binary_encoded_df.date_.value_counts().reset_index().values, columns=["ds", "y"])

        prediction = model.predict(input_variables)[0]

        return flask.render_template('index.html', 
            original_input={'Date':date},
            results = prediction,
            )



if __name__ == "__main__":
    app.run()