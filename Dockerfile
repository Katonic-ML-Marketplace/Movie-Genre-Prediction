FROM python:3.8.2-slim

WORKDIR /app
COPY app.py .
COPY katonic-1.0-py3-none-any.whl .
COPY best_model.joblib .
COPY CountVectorizer.joblib .
COPY TFIDF_transformer.joblib .
COPY favicon.ico .
COPY requirements.txt .
COPY bloody-mary-genres-big.jpg .

RUN pip install -r requirements.txt

CMD streamlit run app.py --server.port=8050 --server.address=0.0.0.0 --logger.level error
