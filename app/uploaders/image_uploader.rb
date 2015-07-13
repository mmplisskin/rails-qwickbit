# Create different versions of your uploaded files:

include CarrierWave::RMagick
version :thumb do
  process :scale => [50, 50]
end

def scale(width, height)
  # do something
end
