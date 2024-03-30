FROM python:3.9

# Copy the entire contents of the current directory to /app
WORKDIR /app
COPY . .

# Install dependencies
RUN apt update && apt install -y less ffmpeg pipx poppler-utils ocrmypdf && \
    pipx install . && \
    echo 'export PATH="/root/.local/bin:$PATH"' >> ~/.bashrc && \
    chmod +x entrypoint.sh

ENV PATH="/root/.local/bin:${PATH}"
ENTRYPOINT ["/app/entrypoint.sh"]
