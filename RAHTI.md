# Step-by-step Instructions for Deploying Smart Business Guide to Rahti

## 1. Prepare the files

1. Add pysqlite3 support at the beginning of app.py (try-except block)
2. Create Dockerfile in the project root
3. Create entrypoint.sh in the project root
4. Make the entrypoint script executable:
   ```
   chmod +x entrypoint.sh
   ```

## 2. Build the Docker image

```bash
docker build -t smart-business-guide:latest .
```

## 3. (Optional) Test the Docker image locally

```bash
docker run -p 8501:8501 --env-file .env smart-business-guide:latest
```

Check the application at http://localhost:8501

## 4. Upload the Docker image to Rahti registry

```bash
# Log in to the CSC Rahti 2 Docker registry
docker login docker-registry.rahti.csc.fi -u <your-username> -p <token>

# Tag the Docker image
docker tag smart-business-guide:latest docker-registry.rahti.csc.fi/<project>/smart-business-guide:latest

# Push the Docker image to the Rahti registry
docker push docker-registry.rahti.csc.fi/<project>/smart-business-guide:latest
```

## 5. Create the application in Rahti management panel

1. Log in to the Rahti management panel
2. Select your project
3. Select "Add to Project" > "Deploy Image"
4. In the Image Name field, enter `docker-registry.rahti.csc.fi/<project>/smart-business-guide:latest`
5. Give your application a name, e.g., "smart-business-guide"
6. **Set environment variables** in the "Environment Variables" section:
   - `TAVILY_API_KEY`: Your Tavily API key
   - `GROQ_API_KEY`: Your Groq API key
   - `OPENAI_API_KEY`: Your OpenAI API key
7. Create the application by clicking "Create"

## 6. Check that the application works

1. Wait for the application to start in Rahti
2. Open the application URL from the Rahti management panel
3. Test the RAG functionality by making queries that require database lookups
