import base64
import io
from PIL import Image
from flask import Flask, json, render_template, request, jsonify
from tensorflow.keras.models import load_model
import cv2
import numpy as np
import psycopg2

app = Flask(__name__)

# indices = {0: 'Catweed', 1: 'Guava', 2: 'Jackfruit', 3: 'Lychee', 4: 'Potato', 5: 'Rose'}
# indices = {0: 'Indian_rhododendron', 1: 'Catweed', 2: 'Guava', 3: 'Barberry', 4: 'Jackfruit', 5: 'Mulberry', 6: 'Chestnut', 7: 'Lychee', 8: 'Orange', 9: 'Mint', 10: 'Potato', 11: 'Rose'}
indices = {0: 'barberry', 1: 'catweed', 2: 'chestnut', 3: 'guava', 4: 'indian_rhododendron', 5: 'jackfruit', 6: 'lychee', 7: 'mulberry', 8: 'orange', 9: 'potato', 10: 'rose', 11: 'spearmint'}

def get_model():
    global model
    # model_name = 'mobilenet_model_6_classes.h5'
    # model_name = 'resnet_model_12_classes.h5'
    model_name = 'resnet_model_12_classes_new.h5'
    model = load_model(model_name)
    print('Model successfully loaded')

def preprocess_image(image):
   # image = cv2.imread(image)
  # print(img.shape)
    image = np.array(image)
    image_normalized = image/255
    image_resized = cv2.resize(image_normalized, (224,224))
    image_reshaped = np.expand_dims(image_resized, axis=0)
    return image_reshaped

def get_prediction_array(preprocessed_image):
    prediction_array = model.predict(preprocessed_image)
    return prediction_array

def get_top_3(probability_array, indices):
    top3 = list(probability_array.flatten().argsort()[-3:][::-1])
    top_probs = {}
    for item in top3:
      label = indices.get(item)
    #   label=label.replace('_', ' ').capitalize()
      probab = probability_array.flatten()[item]
      top_probs[label] = round((probab*100),2)
    return top_probs

print('Loading model...')
get_model()

@app.route('/', methods=['GET'])
def main_page():
    return render_template('main_page.html')

@app.route('/', methods=['POST'])
def predict():
    message = request.get_json(force=True)
    encoded = message['image']
    decoded = base64.b64decode(encoded)
    image = Image.open(io.BytesIO(decoded))
    preprocessed_image = preprocess_image(image)
    prediction_array = get_prediction_array(preprocessed_image)
    response = get_top_3(prediction_array, indices)
    response = { 'top3' : response}
    return jsonify(response)

@app.route('/details/<string:plant_name>', methods=['GET'])
def getDetails(plant_name):
    conn = psycopg2.connect(
        host='localhost',
        database='plantdb',
        user='postgres',
        password='postgres'
    )
    cursor = conn.cursor()
    cursor.execute("select * from plants where common_name='"+plant_name.lower()+"';")
    details = cursor.fetchall()
    columns = [desc[0] for desc in cursor.description]
    columns = [col_name.replace("_", " ").capitalize() for col_name in columns]
    cursor.execute("select feature from characteristics where common_name='"+plant_name.lower()+"';")
    features = cursor.fetchall()
    print(columns)
    features = [item[0] for item in features]
    print(features)
    json_data = {}
    details = details[0]
    for i, column in enumerate(columns):
        if i==0:
            json_data[column] = details[i].replace("_", " ").capitalize()
        else:
            json_data[column]=details[i]
    json_data['Characteristics'] = features
    print(json_data)          
    cursor.close()
    conn.close()
    return render_template('details_page.html', data = json_data)
    
if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
    # app.run(debug=True)
