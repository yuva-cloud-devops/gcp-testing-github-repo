import functions_framework

@functions_framework.http
def hello_serverless(request):
    return {
        "status": "online",
        "service": "cloud-function-2nd-gen",
        "message": "Hello from Google Cloud Function (2nd Gen)!",
        "runtime": "Python 3.11"
    }