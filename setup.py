from setuptools import setup, find_packages

# Read requirements from requirements.in
with open('requirements.in') as f:
    requirements = f.read().splitlines()

setup(
    name="trytry",
    version="1.0.0",
    author="Your Name",
    author_email="your.email@example.com",
    description="A Flask web application",
    long_description=open('README.md').read(),
    long_description_content_type="text/markdown",
    url="https://github.com/yourusername/trytry",
    packages=find_packages(),
    install_requires=requirements,
    python_requires='>=3.9',
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
)
