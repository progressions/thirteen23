require 'cloudinary'
require 'yaml'

Cloudinary.config = OpenStruct.new(YAML.load(File.read(Rails.root.join('config', 'cloudinary.yml'))))
