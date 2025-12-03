# Use the official Swift image
FROM swift:latest

# Set the working directory
WORKDIR /app

# Copy the Swift source file (for standalone builds)
COPY main.swift .

# Compile and run the Swift program
CMD ["swift", "main.swift"]


# docker build -t advent-swift .
# docker run -v "$(pwd)":/app advent-swift