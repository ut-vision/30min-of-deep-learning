#!/bin/bash

# ==== Configurations ====
ENV_NAME="deeplearning-handson"
PYTHON_VERSION="3.12"
TORCH_VERSION="2.5.1"
TORCHVISION_VERSION="0.20.1"
TORCHAUDIO_VERSION="2.5.1"
CUDA_VERSION="12.4"
REQUIREMENTS_FILE="requirements.txt"

# ==== Check if conda is installed ====
if ! command -v conda &> /dev/null; then
    echo "❌ conda is not installed. Please install Anaconda or Miniconda first."
    exit 1
fi

# ==== Create conda environment ====
echo "📦 Creating conda environment: $ENV_NAME (Python $PYTHON_VERSION)..."
conda create -n "$ENV_NAME" python="$PYTHON_VERSION" -y
# conda create -n deeplearning-handson python=3.12 -y
source ~/miniconda3/etc/profile.d/conda.sh
conda activate "$ENV_NAME"
# conda activate deeplearning-handson

# ==== Install PyTorch (GPU/CPU) ====
if command -v nvidia-smi &> /dev/null; then
    echo "✅ GPU detected. Installing GPU-compatible PyTorch..."
    conda install pytorch=$TORCH_VERSION torchvision=$TORCHVISION_VERSION torchaudio=$TORCHAUDIO_VERSION pytorch-cuda=$CUDA_VERSION -c pytorch -c nvidia -y
    # conda install pytorch=2.5.1 torchvision=0.20.1 torchaudio=2.5.1 pytorch-cuda=12.4 -c pytorch -c nvidia -y
else
    echo "⚠️ No GPU detected. Installing CPU-only PyTorch..."
    conda install pytorch=$TORCH_VERSION torchvision=$TORCHVISION_VERSION torchaudio=$TORCHAUDIO_VERSION cpuonly -c pytorch -y
    # conda install pytorch=2.5.1 torchvision=0.20.1 torchaudio=2.5.1 cpuonly -c pytorch -y
fi

# ==== Install pip packages ====
if [ -f "$REQUIREMENTS_FILE" ]; then
    echo "📄 Installing pip packages from $REQUIREMENTS_FILE..."
    pip install -r "$REQUIREMENTS_FILE"
    # pip install -r requirements.txt
else
    echo "⚠️ $REQUIREMENTS_FILE not found. Skipping pip install."
fi

# ==== Output environment info ====
echo "📋 Python packages:"
conda list

echo "🧪 PyTorch info:"
python -c "import torch; print(f'CUDA available: {torch.cuda.is_available()}'); print(f'CUDA version: {torch.version.cuda}'); print(f'Device: {torch.cuda.get_device_name(0) if torch.cuda.is_available() else 'CPU only'}')"

echo "✅ Setup complete!"
