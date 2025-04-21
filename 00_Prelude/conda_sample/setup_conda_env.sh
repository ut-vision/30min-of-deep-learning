#!/bin/bash

# ==== Configurations ====
ENV_NAME="deeplearning-handson"
PYTHON_VERSION="3.13"
TORCH_VERSION="2.6.0"
TORCHVISION_VERSION="0.21.0"
TORCHAUDIO_VERSION="2.6.0"
CUDA_VERSION="124" # CUDA runtime 12.4
REQUIREMENTS_FILE="requirements.txt"

# ==== Check if conda is installed ====
if ! command -v conda &> /dev/null; then
    echo "❌ conda is not installed. Please install Anaconda or Miniconda first."
    exit 1
fi

# ==== Create conda environment ====
echo "📦 Creating conda environment: $ENV_NAME (Python $PYTHON_VERSION)..."
conda create -n "$ENV_NAME" python="$PYTHON_VERSION" -y
source ~/miniconda3/etc/profile.d/conda.sh
conda activate "$ENV_NAME"

# ==== Install PyTorch (GPU/CPU) ====
if command -v nvidia-smi &> /dev/null; then
    echo "✅ GPU detected. Installing GPU-compatible PyTorch..."
    pip3 install torch=="$TORCH_VERSION" torchvision=="$TORCHVISION_VERSION" torchaudio=="$TORCHAUDIO_VERSION" --index-url https://download.pytorch.org/whl/cu"$CUDA_VERSION"
else
    echo "⚠️ No GPU detected. Installing CPU-only PyTorch..."
    pip3 install torch=="$TORCH_VERSION" torchvision=="$TORCHVISION_VERSION" torchaudio=="$TORCHAUDIO_VERSION" --index-url https://download.pytorch.org/whl/cpu
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
