class Cloudinary
  def self.config=(config)
    @@config = config
  end

  def self.config
    @@config
  end

  attr_accessor :file, :response

  def initialize(file:)
    self.file = file
  end

  def config
    Cloudinary.config[Rails.env]
  end

  def params
    {
      timestamp: DateTime.now.utc.to_i,
    }
  end

  def sorted_params
    Hash[params.sort]
  end

  def serialized_params_plus_secret
    sorted_params.to_query + secret
  end

  def signature
    Digest::SHA1.hexdigest(serialized_params_plus_secret)
  end

  def request_params
    params.merge(
      signature: signature,
      file: file,
      api_key: api_key,
    )
  end

  def secret
    config['api_secret']
  end

  def cloud_name
    config['cloud_name']
  end

  def api_key
    config['api_key']
  end

  def remote_upload_url
    "https://api.cloudinary.com/v1_1/#{cloud_name}/image/upload"
  end

  def upload
    @response = RestClient.post(remote_upload_url, request_params)
  end

  def parsed_response
    JSON.parse(response)
  end

  def public_id
    parsed_response['public_id']
  end
end
