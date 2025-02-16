# Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
docker run --rm -it --name terraform-deployer -v "$(Get-Location):/app" -w /app terraform-deployer
