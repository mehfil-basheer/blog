<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API Documentation</title>
    <link rel="stylesheet" href="{{ asset('swagger-ui/swagger-ui.css') }}">
</head>
<body>
    <div id="swagger-ui"></div>
    <script src="{{ asset('swagger-ui/swagger-ui-bundle.js') }}"></script>
    <script src="{{ asset('swagger-ui/swagger-ui-standalone-preset.js') }}"></script>
    <script>
        SwaggerUIBundle({
            url: '{{ asset('blog.yaml') }}',  
            dom_id: '#swagger-ui',
            deepLinking: true,
            presets: [
                SwaggerUIBundle.presets.apis,
                SwaggerUIStandalonePreset
            ],
            layout: "StandaloneLayout"
        });
    </script>
</body>
</html>
