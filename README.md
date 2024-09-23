The Dockerfile is a text file that contains instructions to build your custom image. Start with a base Ubuntu image and then add your custom modifications (e.g., install software, set environment variables). -> See Dockerfile

When happy, build, test and push the image

docker build -t my-custom-ubuntu-image:latest .

docker run -it my-custom-ubuntu-image:latest

docker login

docker tag my-custom-ubuntu-image:latest dockerhubusername/my-custom-ubuntu:latest

docker push dockerhubusername/my-custom-ubuntu:latest

Use the Custom Image in GitHub Actions -> see .yaml
