module ImageHelpers
  def parameterize(string)
    Iconv.conv('ascii//ignore//translit', 'utf-8', string)
      .gsub(/(\W+)/, "-").downcase
  end

  def srcset(image, sizes)
    sizes.map { |size| srcset_entry(image, size) }.join(", ")
  end

  def srcset_entry(image, size)
    "#{image_path(image, resize_to: size)} #{size}w"
  end
end
