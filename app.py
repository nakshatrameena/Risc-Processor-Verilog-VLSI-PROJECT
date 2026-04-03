# app.py

from flask import Flask, send_from_directory
import os

app = Flask(__name__, static_folder='.')

# Home route → serves index.html
@app.route('/')
def home():
    return send_from_directory('.', 'index.html')


# Optional: serve other static files (CSS, JS, images if added later)
@app.route('/<path:path>')
def static_files(path):
    return send_from_directory('.', path)


# Run the app
if __name__ == "__main__":
    port = int(os.environ.get("PORT", 10000))  # Render uses dynamic port
    app.run(host="0.0.0.0", port=port)