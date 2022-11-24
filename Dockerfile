FROM python:3.8.2-slim

RUN mkdir -p img_src models

COPY app.py .
COPY models/best_model.joblib models/.
COPY models/CountVectorizer.joblib models/.
COPY models/TFIDF_transformer.joblib models/.
COPY requirements.txt .
COPY img_src/bloody-mary-genres-big.jpg img_src/.

RUN pip install -r requirements.txt

CMD streamlit run app.py --server.port=8050 --server.address=0.0.0.0 --logger.level error