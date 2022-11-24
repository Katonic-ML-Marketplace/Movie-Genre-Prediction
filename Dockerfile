FROM python:3.8.2-slim

RUN mkdir -p img_src 

COPY app.py .
COPY best_model.joblib .
COPY CountVectorizer.joblib .
COPY TFIDF_transformer.joblib .
COPY requirements.txt .
COPY img_src/bloody-mary-genres-big.jpg img_src/.

RUN pip install -r requirements.txt

CMD streamlit run app.py --server.port=8050 --server.address=0.0.0.0 --logger.level error