# Simulacion-proyecto-11

## 📄 Sistema Inteligente de Clasificación y Extracción de Documentos (Document AI — Modelo Neuronal CNN + LLM + Aprendizaje por Refuerzo)

Sistema integral basado en **Visión por Computadora (Redes Neuronales Convolucionales - CNN)**, **Extracción Óptica de Información (OCR)**, **Modelo de Lenguaje Grande Pre-entrenado (LLM conectado por Pipeline)** y **Aprendizaje por Refuerzo con Feedback Humano (RLHF / Q-Learning)** para la clasificación automática, recomendación inteligente (**> 200 caracteres**) y digitalización estructurada de documentos empresariales en bases de datos relacionales **MySQL** y **SQLite**.

---

### 🧠 Actividad Corte 3 Final: Pipeline Modelo Neuronal + LLM + Aprendizaje por Refuerzo (RL)

1. **Modelo Pre-entrenado LLM conectado por Pipeline (30%):**
   - Módulo implementado en [`Web/llm_rl_engine.py`](Web/llm_rl_engine.py) (`LLMPipelineEngine`) e integrado en [`Web/app.py`](Web/app.py).
   - La predicción de la Red Neuronal CNN (`invoices`, `PurchaseOrders`, `Shipping orders`, `Inventory Report`) junto con los campos reales extraídos del documento ingresan como **INPUT** a un **Prompt Estructurado** conectado al pipeline generativo (`Meta-Llama-3.2-3B-Instruct / HuggingFace Pipeline`).
   - Genera una recomendación ejecutiva, contable y logística de **más de 200 caracteres** (típicamente **600 a 1,100 caracteres**), detallando las acciones específicas a tomar con el documento clasificado.

2. **Aprendizaje por Refuerzo para Calificar Recomendaciones con Feedback del Usuario (30%):**
   - Implementado mediante un agente de **Q-Learning Contextual (`RLRecommendationAgent`)** con espacio de estados $S$ (las 4 categorías documentales de la CNN) y espacio de acciones $A$ (4 enfoques de recomendación: *Auditoría Contable y Tributaria*, *Gestión Operativa y Logística*, *Análisis Financiero y Tesorería*, *Control Interno 3-Way Match*).
   - El usuario califica cada recomendación en la interfaz web (de **1 a 5 estrellas** o botones rápidos de recompensa $r \in [-1.0, +1.0]$ + comentario opcional).
   - El agente actualiza en vivo la Tabla $Q(s, a)$ mediante la ecuación de Bellman / Q-Learning:
     $$Q(s, a) \leftarrow Q(s, a) + \alpha \cdot \big[ r - Q(s, a) \big]$$
   - Si el feedback del usuario es negativo ($\le 2\star$), el agente penaliza la estrategia actual, selecciona automáticamente la nueva política óptima $\pi^*(s) = \arg\max_a Q(s, a)$ y **regenera la recomendación del LLM en tiempo real**.

3. **Funcionamiento Integral Web + Base de Datos (40%):**
   - Interfaz interactiva en [`Web/templates/index.html`](Web/templates/index.html) con visualización del texto generativo del LLM, contador de caracteres, visor del Prompt de entrada, widget de calificación RL por estrellas y panel con la **Matriz $Q(s, a)$ en vivo**.

---

### 🏛️ Arquitectura del Repositorio

El repositorio está organizado en dos módulos principales:

```text
Simulacion-proyecto-11/
├── Proyecto/                        # Módulo de Inteligencia Artificial & Entrenamiento
│   ├── RedesNeuronales_11.ipynb     # Notebook interactivo con todo el flujo de entrenamiento
│   ├── train_and_evaluate.py        # Script de entrenamiento CNN, validación y test
│   ├── prepare_dataset.py           # Pipeline de procesamiento y particionado del dataset
│   ├── generate_extra_plots.py      # Generador de gráficas de convergencia y métricas
│   ├── build_executed_notebook.py   # Constructor del notebook con celdas ejecutadas
│   ├── modelo_documentos.keras      # Modelo CNN entrenado (Keras 3)
│   ├── modelo_documentos.h5         # Modelo CNN en formato HDF5 legacy
│   ├── dataset.zip                  # Dataset estructurado en clases (9.3 MB)
│   ├── dataset_original.csv         # Metadatos del dataset original
│   ├── classes.json / classes.txt   # Mapeo de categorías
│   ├── training_metrics.json        # Métricas de entrenamiento y test (100% test accuracy)
│   └── *.png                        # Curvas de pérdida, acierto/error y matriz de confusión
│
├── Web/                             # Módulo del Sistema Web & Inferencia en Tiempo Real
│   ├── app.py                       # Servidor Flask, inferencia CNN, OCR y persistencia MySQL
│   ├── templates/
│   │   └── index.html               # Interfaz moderna (Tailwind CSS, Visor Split-Screen, Filtros)
│   ├── company-document-text.csv    # Índice de referencia documental para OCR
│   ├── requirements.txt             # Dependencias del servidor web
│   ├── iniciar_servidor_web.bat     # Script de inicio rápido con 1-clic
│   ├── modelo_documentos.keras      # Modelo de inferencia
│   └── documentos_de_prueba/        # Más de 400 documentos de muestra para pruebas
│
├── .gitignore                       # Filtro de exclusión para Git
└── README.md                        # Documentación técnica del proyecto
```

---

### 🎯 Tipos de Documentos Soportados

El sistema clasifica y extrae información especializada para 4 categorías empresariales:

1. **🧾 Facturas Comerciales (`invoices`)**:
   - Extracción de: N° Factura, Razón Social / Contacto, NIT / Customer ID, Fecha de Emisión, Dirección de Facturación, Total y Detalle de Líneas de Productos.
   - Tabla MySQL: `facturas`.

2. **📑 Órdenes de Compra (`PurchaseOrders`)**:
   - Extracción de: N° Orden, Cliente / Comprador, Fecha de Pedido, Cantidad de Items y Total Liquidado.
   - Tabla MySQL: `ordenes_compra`.

3. **🚚 Despachos de Envío (`Shipping orders`)**:
   - Extracción de: N° Guía de Despacho, Destinatario (*Ship To*), Transportadora (*Federal Shipping*, etc.), Fecha de Pedido, Fecha de Despacho, Dirección de Entrega y Total Flete.
   - Tabla MySQL: `despachos_envio`.

4. **📦 Reportes de Inventario (`Inventory Report`)**:
   - Extracción de: Identificador de Reporte, Periodo Mensual, Categoría del Almacén, Unidades Vendidas y Unidades en Stock.
   - Tabla MySQL: `reportes_inventario`.

---

### 🗄️ Esquema de Base de Datos MySQL (`docuai_sistema`)

El sistema cuenta con persistencia automática en **MySQL 8** mediante las siguientes tablas relacionales:

* `documentos_procesados`: Tabla maestra con el historial consolidado, predicción del modelo CNN, métricas de confianza, tiempo de procesamiento y enlace al archivo original.
* `facturas`: Tabla especializada para facturación.
* `ordenes_compra`: Tabla especializada para compras y adquisiciones.
* `despachos_envio`: Tabla especializada para logística y envíos.
* `reportes_inventario`: Tabla especializada para control de existencias en bodega.
* `items_detalle`: Tabla con el detalle desglosado de productos/artículos por cada documento mediante clave foránea (`documento_id`).

---

### 🚀 Instalación y Ejecución

#### 1. Requisitos Previos
* **Python 3.10 o 3.11**
* **MySQL Server** (Servicio local en puerto `3306`)
* Administrador de paquetes recomendado: **`uv`** o **`pip`**

#### 2. Configuración de Base de Datos MySQL
El sistema crea automáticamente la base de datos `docuai_sistema` y todas las tablas al iniciar la aplicación.
Configuración por defecto en `app.py`:
- **Host**: `mysql-torneofutbol.alwaysdata.net` (puerto `3306`)
- **Usuario**: `torneofutbol`
- **Base de Datos**: `torneofutbol_docuai_sistema`

#### 3. Iniciar el Servidor Web

**Opción A: Inicio con script .bat (Windows)**
Haz doble clic en `Web/iniciar_servidor_web.bat`.

**Opción B: Inicio por consola**
```bash
cd Web
uv run --python 3.11 --with flask --with tensorflow --with pymupdf --with pillow --with winocr --with pymysql python app.py
```
O con `pip`:
```bash
cd Web
pip install -r requirements.txt
python app.py
```

Accede desde tu navegador a:
👉 **`http://localhost:5000`**

---

### 📊 Rendimiento del Modelo Convolucional (CNN)

* **Precisión en Test (Accuracy)**: **100.00%**
* **Tasa de Error**: **0.00%**
* **Tiempo Promedio de Inferencia**: **~0.02 - 0.25 segundos**
* **Matriz de Confusión**: Clasificación perfecta en el conjunto de prueba para todas las clases documentales.
