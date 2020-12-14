class S3Service
  def initialize(user)
    @current_user = user

    @client = Aws::S3::Client.new(
      region: 'eu-west-2',
      access_key_id: Rails.application.credentials.s3_bucket_access_key_id,
      secret_access_key: Rails.application.credentials.s3_bucket_secret_access_key
    )

    s3 = Aws::S3::Resource.new(client: @client)
    @bucket = s3.bucket(Rails.configuration.application[:s3_bucket])
  end

  def upload_image(recipe_id, file, image_type, order_index, step_number)
    recipe_folder = recipe_folder_name(recipe_id)
    file_name = generate_file_name(image_type, order_index, step_number)
    object = @bucket.object("images/#{@current_user.id}/#{recipe_folder}/#{file_name}")

    metadata = {
      image_type: image_type,
      order_index: order_index,
      step: step_number
    }

    object.put(body: file.tempfile, metadata: metadata)
    puts "Uploading file to bucket meal-scheduler-images."
  end

  def download_images(recipe_id)
    recipe_folder = recipe_folder_name(recipe_id)
    folder = "images/#{@current_user.id}/#{recipe_folder}/"

    image_names_array = find_s3_recipe_images(folder)

    images = []
    image_names_array.each do |image_name|
      object = @client.get_object(bucket: Rails.configuration.application[:s3_bucket], key: image_name)
      images.push({
        file_name: "#{Rails.configuration.application[:s3_bucket_url]}#{image_name}",
        image_type: object.metadata['image_type'] ,
        order_index: object.metadata['order_index'],
        step_number: object.metadata['step']
      })
    end
    
    images
  end

  def delete_recipe_images(recipe_id)
    recipe_folder = recipe_folder_name(recipe_id)
    folder = "images/#{@current_user.id}/#{recipe_folder}/"

    image_names_array = find_s3_recipe_images(folder)

    image_names_array.each do |image_name|
      object = @bucket.object(image_name)
      object.delete
    end
  end

  private

  def find_s3_recipe_images(folder)
    @bucket.objects(prefix: folder).map(&:key)
  end

  def generate_file_name(image_type, order_index, step_number)
    if step_number == 'null'
      return "#{image_type}_#{order_index}_#{step_number}"
    else
      return "#{image_type}_#{order_index}"
    end
  end

  def recipe_folder_name(recipe_id)
    recipe_id.to_s.rjust(16, '0')
  end
end