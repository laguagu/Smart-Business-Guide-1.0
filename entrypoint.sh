#!/bin/bash
set -e

# Create secrets.toml from environment variables with proper TOML formatting
mkdir -p .streamlit
cat > .streamlit/secrets.toml << EOF
# API Keys
TAVILY_API_KEY = "${TAVILY_API_KEY}"
GROQ_API_KEY = "${GROQ_API_KEY}"
OPENAI_API_KEY = "${OPENAI_API_KEY}"
EOF

# Start Streamlit
exec streamlit run app.py --server.port=8501 --server.address=0.0.0.0