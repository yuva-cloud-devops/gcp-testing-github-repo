# Lightweight production Alpine Nginx image
FROM nginx:alpine

# Remove default nginx welcome configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom configuration supporting ports 80 and 8080 and JSON responses
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy custom JSON file to the web root
COPY app-data.json /usr/share/nginx/html/app-data.json

# Expose both 80 (standard HTTP) and 8080 (Cloud Run default)
EXPOSE 80 8080

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
