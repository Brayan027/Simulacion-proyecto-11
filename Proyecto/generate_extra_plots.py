import matplotlib.pyplot as plt
import numpy as np
import json
import tensorflow as tf
from tensorflow import keras
from PIL import Image
import os

with open("training_metrics.json", "r", encoding="utf-8") as f:
    metrics = json.load(f)

class_names = metrics["class_names"]
cm = np.array(metrics["confusion_matrix"])

# 1. Matriz de Confusión Gráfica
plt.figure(figsize=(7, 6))
plt.imshow(cm, interpolation='nearest', cmap=plt.cm.Blues)
plt.title('Matriz de Confusión en Datos de TEST (No Vistos)', fontsize=13, fontweight='bold', pad=12)
plt.colorbar()
tick_marks = np.arange(len(class_names))
plt.xticks(tick_marks, class_names, rotation=25, ha='right', fontsize=9)
plt.yticks(tick_marks, class_names, fontsize=9)

thresh = cm.max() / 2.
for i in range(cm.shape[0]):
    for j in range(cm.shape[1]):
        plt.text(j, i, format(cm[i, j], 'd'),
                 ha="center", va="center",
                 color="white" if cm[i, j] > thresh else "black",
                 fontweight='bold', fontsize=11)

plt.ylabel('Etiqueta Real (Ground Truth)', fontweight='bold')
plt.xlabel('Predicción del Modelo CNN', fontweight='bold')
plt.tight_layout()
plt.savefig("matriz_confusion_test.png", dpi=200)
plt.close()
print("[+] Guardado matriz_confusion_test.png")

# 2. Visualización de predicciones sobre 4 muestras de test
model = tf.keras.models.load_model("modelo_documentos.keras")
plt.figure(figsize=(12, 6))

sample_classes = ['invoices', 'PurchaseOrders', 'Shipping orders', 'Inventory Report']
for idx, cat in enumerate(sample_classes):
    cat_dir = os.path.join("dataset/test", cat)
    sample_file = os.listdir(cat_dir)[0]
    img_path = os.path.join(cat_dir, sample_file)

    img = keras.utils.load_img(img_path, target_size=(160, 160))
    img_array = keras.utils.img_to_array(img)
    img_batch = np.expand_dims(img_array, axis=0)

    pred = model.predict(img_batch, verbose=0)
    pred_idx = np.argmax(pred[0])
    pred_name = class_names[pred_idx]
    confidence = pred[0][pred_idx] * 100

    plt.subplot(1, 4, idx + 1)
    plt.imshow(keras.utils.load_img(img_path))
    plt.axis('off')
    color = 'green' if pred_name == cat else 'red'
    plt.title(f"Real: {cat}\nPred: {pred_name}\nConf: {confidence:.1f}%", fontsize=9, fontweight='bold', color=color)

plt.suptitle("Inferencia del Modelo CNN sobre Documentos No Vistos (Test Set)", fontsize=13, fontweight='bold')
plt.tight_layout()
plt.savefig("predicciones_muestras_test.png", dpi=200)
plt.close()
print("[+] Guardado predicciones_muestras_test.png")
