import base64
import io
from PIL import Image
from flask import Flask, render_template, request, jsonify
from tensorflow.keras.models import load_model
import cv2
import numpy as np
app = Flask(__name__)


indices = {0: 'Alien', 1: 'Guava', 2: 'Jackfruit', 3: 'Lychee', 4: 'Potato', 5: 'Rose'}

def get_model():
    global model
    model = load_model('mobilenet_model_6_classes.h5')
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
      label=label.replace('_', ' ').capitalize()
      probab = probability_array.flatten()[item]
      top_probs[label] = round((probab*100),2)
    return top_probs

print('Loading model...')
get_model()

@app.route('/')
def main_page():
    return render_template('main_page.html')

@app.route('/predict', methods=['POST','GET'])
def predict():
    message = request.get_json(force=True)
    encoded = message['image']
    decoded = base64.b64decode(encoded)
    image = Image.open(io.BytesIO(decoded))
    preprocessed_image = preprocess_image(image)
    prediction_array = get_prediction_array(preprocessed_image)
    response = get_top_3(prediction_array, indices)
    response = { 'top3' : response }
    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True)
